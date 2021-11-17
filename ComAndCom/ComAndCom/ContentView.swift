//
//  ContentView.swift
//  ComAndCom
//
//  Created by Dave Brunner on 26.10.21.
//

import SwiftUI

struct ContentView: View {
   // var responce: Responce?
    //var imageInfoArray: [ImageInfo]?
    //let userDefault = UserDefaults(suiteName: "group.dave")
    var model: Response?


    init(){
        //responce = userDefault?.value(forKey: "responce") as? Responce
        //imageInfoArray = userDefault?.value(forKey: "imageInfoArray") as? [ImageInfo]
        //imageInfoArray = imageInfoArray!
        
       
    }
    
    var body: some View {
        Text("Hallo")
        
            .task {
                do{
                    let loader = Loader()
                    model = try await loader.load()          }
                catch {
                    print("error")
                }
               
            }
        
        
        //Text(imageInfoArray[0].title ?? "hh")
            List{
                ForEach(model!.images, id: \.identifier) {
                line in
        Text("\(line.title) as! String")
           // }
            
            
    }
    }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
