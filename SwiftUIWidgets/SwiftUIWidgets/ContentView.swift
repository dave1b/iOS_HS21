//
//  ContentView.swift
//  SwiftUIWidgets
//
//  Created by Dave Brunner on 19.10.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var constants = MyGlobalValues()
    
    
    var body: some View {
 
        let steelGray = Color(white: 0.7745)
        VStack(){
            Text("title1").font(.system(size: 45, weight: .bold, design: .default))
                .padding()
            Spacer().frame( height:40)
            HStack{
                Text("#Clicks: ").font(.system(size: 20.0)).bold()
                Text(String(constants.counter))
            }
            
            HStack{
            Button("inc"){
                constants.counter += 1
            }
            Button("reset"){
                constants.counter = 0
            }
            }
            Text("title2").font(.system(size: 30.0)).bold()
            Picker("", selection:  $constants.selectedIcon){
                ForEach(constants.iconOptions, id:\.self) {
                    iconName in
                    Text(iconName)
                }
            }.pickerStyle(SegmentedPickerStyle())
            Text(constants.selectedIcon)
            Divider()
            Spacer()
            
        }.background(steelGray.edgesIgnoringSafeArea(.all))
       // let userDefaults = UserDefaults(suiteName: Constants.group.dave)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
