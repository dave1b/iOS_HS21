//
//  CodableFileWrite.swift
//  Presistency
//
//  Created by Dave Brunner on 09.11.21.
//

import Foundation






class CodableFileWrite<T: Codable> {
    let jsonData: Data
    let filename: URL
    let str: String = "Hoi zäme"
    init(){
        jsonData = try! encoder.encode(infos)
       
    }
    
    let encoder = JSONEncoder()
    let infos = ["Nico", "Fabian", "Daniela", "Davide"]
    
   

    func getDocumentsDirectory(fileName2: String) -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path1 = paths[0]
        return path1.appendingPathComponent(fileName2)
    }
    
    
    
    
    
    static func write(_ content: String, to fileName2: String) throws {
        let filename3 = getDocumentsDirectory(fileName2)
        do {
            try content.write(to: filename3, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
        }
        
        
        
    }
    
    static func read(from fileName: String) throws -> T{
        @inlinable init (contentsOf url: URL, options: Data.ReadingOptions = []) throws
    }
    
   
    
}
