//
//  TenorResource.swift
//  Tubi TV Blake Challenge
//
//  Created by Blake Barrett on 2/16/19.
//  Copyright © 2019 Blake Barrett. All rights reserved.
//

class TenorResource {
    
    let url: String
    
    let preview: String
    
    let dims: [Int]
    
    var duration: Double?
    
    var size: Int?
    
    var width: Int {
        
        get {
            
            return dims[0]
            
        }
        
    }
    
    var height: Int {
        
        get {
            
            return dims[1]
            
        }
        
    }
    
    init(from json: JSON) {
        
        url = json["url"] as! String
        
        preview = json["preview"] as! String
        
        dims = json["dims"] as! [Int]
        
        if let duration = json["duration"] {
            
            self.duration = (duration as! Double)
            
        }
        
        if let size = json["size"] as? Int {
            
            self.size = size
            
        }
    }
}
