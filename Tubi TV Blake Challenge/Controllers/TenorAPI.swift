//
//  TenorAPI.swift
//  Tubi TV Blake Challenge
//
//  Created by Blake Barrett on 2/16/19.
//  Copyright © 2019 Blake Barrett. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]
typealias TenorSuccessResponse = ([TenorResource]?) -> ()
typealias TenorErrorResponse = (Error) -> ()

private protocol TenorAPIProtocol {
    
    func requestAnonRequestID(success: @escaping (String) -> (),
                              failure: @escaping () -> ())
    
    func search(for query: String,
                success: @escaping TenorSuccessResponse,
                failure: @escaping TenorErrorResponse)
}

class TenorAPI: TenorAPIProtocol {
    
    static let baseAPIURL = "https://api.tenor.com/v1/"
    static let apiKey: String = "25BAZVPXTBJY"
    
    static var anonymousID: String = ""
    
    var ready: Bool {
        get {
            return TenorAPI.anonymousID != ""
        }
    }
    
    private var queue = [(String, TenorSuccessResponse, TenorErrorResponse)]()
    
    init() {
        if TenorAPI.anonymousID == "" {
            requestAnonRequestID(success: {[weak self] (value) in
                
                TenorAPI.anonymousID = value
                
                self?.queue.forEach { (request: (query: String, success: TenorSuccessResponse, error: TenorErrorResponse)) in
                    
                    self?.search(for: request.query, success: request.success, failure: request.error)
                }
            }) {
                // poop!
                print("oops")
            }
        }
    }
    
    func search(for query: String,
                success: @escaping TenorSuccessResponse,
                failure: @escaping TenorErrorResponse) {
        
        guard ready else {
            self.queue.append((query, success, failure))
            return
        }
        
        let limit = 25
        
        let searchTerm = query.replacingOccurrences(of: " ", with: "+")
        
        let searchString = String(format:
            "%@search?key=%@&anon_id=%@&limit=%d&q=%@",
                                  TenorAPI.baseAPIURL,
                                  TenorAPI.apiKey,
                                  TenorAPI.anonymousID,
                                  limit,
                                  searchTerm)
        guard let searchURL = URL(string: searchString) else { return }
        let searchRequest = URLRequest(url: searchURL)
        
        makeWebRequest(urlRequest: searchRequest,
                       callback: { (value: JSON) in
                        let results = value["results"] as? [JSON]
                        var gifs = [TenorResource]()
                        results?.forEach { result in
                            
                            let response = TenorResponse(from: result)
                            if let gif = response.mp4 {
                                gifs.append(gif)
                            }
                        }
                        
                        DispatchQueue.main.async {
                            success(gifs)
                        }
        })
    }
    
    // Thanks Tenor API docs!
    func makeWebRequest(urlRequest: URLRequest, callback: @escaping (JSON) -> ()) {
        // Make the async request and pass the resulting json object to the callback
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? JSON {
                    // Push the results to our callback
                    callback(jsonResult)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
        DispatchQueue.global(qos: .background).async {
            task.resume()
        }
    }
    
    func requestAnonRequestID(success: @escaping (String) -> (),
                              failure: @escaping () -> () ) {
        
        let requestString = String(format: "%@anonid?key=%@", TenorAPI.baseAPIURL, TenorAPI.apiKey)
        let requestUrl = URL(string: requestString)
        let anonymousIDRequest = URLRequest(url: requestUrl!)
        
        makeWebRequest(urlRequest: anonymousIDRequest) { (response: JSON) in
            if let anonymousID = response["anon_id"] as? String {
                success(anonymousID)
            } else {
                failure()
            }
        }
    }
}
