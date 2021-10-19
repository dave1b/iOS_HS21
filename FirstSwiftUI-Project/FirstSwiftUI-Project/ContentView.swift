//
//  ContentView.swift
//  FirstSwiftUI-Project
//
//  Created by Dave Brunner on 03.10.21.
//

import SwiftUI

//let laps: [Date] = [Date(), Date()]



struct ContentView: View {
    @State var start = Date()
    @State var laps: [Date] = []
    
    
    var body: some View {
        Form{
        
       
        VStack{
            
            Spacer().frame(height: 20)
            HStack{
                
                LapButtonView(laps: $laps)
                Spacer().frame(width: 145)
                ReserButtonView(laps: $laps, start: $start)
                
            }
            Spacer().frame(height: 20)
           
          
            
            
            ForEach(laps, id:\.self){
                lapstart in
                LapRowView(globalStart: start, lapStart: lapstart)
                Spacer().frame(height: 10)
                
            }
        }
        }
        
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ContentView()
           
            }
        }
    }
    
}

