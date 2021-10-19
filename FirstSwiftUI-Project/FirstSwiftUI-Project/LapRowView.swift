//
//  LapRowView.swift
//  FirstSwiftUI-Project
//
//  Created by Dave Brunner on 03.10.21.
//

import Foundation
import SwiftUI



	
struct LapRowView: View {
    let globalStart: Date
    let lapStart: Date
//    @Binding var globalStart: Date
//    @Binding var lapStart: Date
    
    
    
    
    var durationString: String {
        let difference = Calendar.current.dateComponents([.second], from: globalStart, to: lapStart)
        if difference.second != nil {
            return "\(String(difference.second!)) sec"
        }
        return ""
    }
    
    
    var body: some View {
        

        VStack{
           
            HStack {
                Spacer().frame(width: 20)
                VStack (alignment: .leading) {
                    Text(durationString)
                    Text(lapStart, style: .time)
                }
                Spacer()
                Image(systemName: "timer").font(.system(size: 20, weight: .regular))
                Spacer().frame(width: 20)
                
            }.padding(10).background(Color(red: 0.6, green: 0.7, blue: 0.7)).cornerRadius(20)
                
        
    }
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        
        
        
        static var previews: some View {
            LapRowView(globalStart: Date(), lapStart: Date() )
        }
    }
    
}


