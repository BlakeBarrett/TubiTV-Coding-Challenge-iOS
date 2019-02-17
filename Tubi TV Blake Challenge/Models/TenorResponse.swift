//
//  TenorResponse.swift
//  Tubi TV Blake Challenge
//
//  Created by Blake Barrett on 2/16/19.
//  Copyright © 2019 Blake Barrett. All rights reserved.
//

import Foundation

class TenorResponse {
    
    let id: String
    
    let title: String

    var url: String
    
    let tags: [String]
    
    var media = [TenorResource]()
    
    init(from json: JSON) {
        id = json["id"] as! String
        title = json["title"] as! String
        url = json["url"] as! String
        tags = json["tags"] as! [String]
        if let mediae = json["media"] as? [JSON] {
            mediae.forEach { media in
                media.forEach { value in
                    if let valueJson = value as? JSON {
                        var resource = TenorResource(from: valueJson)
                        self.media.append(resource)
                    }
                }
            }
        }
    }
}
