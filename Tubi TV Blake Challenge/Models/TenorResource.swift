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
    
    let duration: Float
    
    let size: Int
    
    init(from json: JSON) {
        url = json["url"] as! String
        preview = json["preview"] as! String
        dims = json["dims"] as! [Int]
        duration = json["duration"] as! Float
        size = json["size"] as! Int
    }
    
}
