//
//  LapButtonView.swift
//  FirstSwiftUI-Project
//
//  Created by Dave Brunner on 03.10.21.
//

import Foundation
import SwiftUI


struct LapButtonView : View {
    
    @Binding var laps: [Date]
    
    
    
    
    var body: some View{
        
        
        
        
        Button(action: {
            laps.append(Date())
//            print("skdflsjdflsdf")
        }) {
            Text("Neue Runde")
              
        
        
        }  .padding()
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(20)
            .buttonStyle(BorderlessButtonStyle())

    }
    
    
    
}
