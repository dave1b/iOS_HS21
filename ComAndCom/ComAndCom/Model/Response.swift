//
//  Responce.swift
//  ComAndCom
//
//  Created by Dave Brunner on 26.10.21.
//

import Foundation

struct Response: Codable {
    let id = UUID()
    let images: [ImageInfo]
    
    let lastUpdate: Date
    let info: String
    
    
   
}
