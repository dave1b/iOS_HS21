//
//  ComAndComController.swift
//  ComAndCom
//
//  Created by Dave Brunner on 26.10.21.
//

import Foundation
import UIKit


class Loader {
    
    
    
    func load() async -> Response {
       
        var model: Response?
        let url = URL(string: "https://hslu.nitschi.ch/networking/data.json")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = Data ()
        request.timeoutInterval = 20
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                 print("Request failed with \(error)")
            }
            else if let data = data {
            let _ = String(data: data, encoding: .utf8)
            //let _ = UIImage(data: data)
        }
        
        do {
            var result: Response?
        model = try JSONDecoder().decode(Response.self, from: data!)
        } catch {
            print("didnt work")
        }
           /* let images = await withTaskGroup(of: UIImage.self, returning: [UIImage].self) {
                TaskGroup in for title in titles {
                    taskGroup.addTask{
                        return await self.loadImage(title: title)
                    }
                }
                var images: [UIImage] = []
                for await image in taskGroup {
                    images.append(image)
                }
                return images
            }*/
        
     
       
      
    }
        print(model)
        task.resume()
        return model!
}
    
    
}
