//
//  ResetButtonView.swift
//  FirstSwiftUI-Project
//
//  Created by Dave Brunner on 03.10.21.
//

import Foundation

import SwiftUI


struct ReserButtonView : View {
    
    @Binding var laps: [Date]
    @Binding var start: Date
    
    
    
    var body: some View{
        
        
        
        
        Button(action: {
            laps.removeAll()
            start = Date()
//            print("skdflsjdflsdf")
        }) {
            Text("Reset")
               
        
        
        } .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(20)
            .buttonStyle(BorderlessButtonStyle())

    }
    
    
    
}


