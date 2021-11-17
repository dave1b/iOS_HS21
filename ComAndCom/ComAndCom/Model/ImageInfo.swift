//
//  ImageInfo.swift
//  ComAndCom
//
//  Created by Dave Brunner on 26.10.21.
//

import Foundation


struct ImageInfo: Codable {
    let identifier: Int
    let title: String
    let text: String
    let url: URL
}
