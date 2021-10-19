//
//  Constants.swift
//  SwiftUIWidgets
//
//  Created by Dave Brunner on 19.10.21.
//

import Foundation
 
class MyGlobalValues: ObservableObject  {
    
    
    
    @Published var backGroundColor = "Color.gray"
    @Published var counter: Int = 0
    
    @Published var iconOptions = ["☮️","🎶","🐰","💎"]
    @Published var selectedIcon : String = "☮️"
    
    init() {
        self.backGroundColor = UserDefaults.standard.object(forKey: "backGroundColor") as? String ?? ""
        //self.backGroundColor = UserDefaults.standard.object(forKey: "iconOptions") as? String ?? ""
        self.selectedIcon = UserDefaults.standard.object(forKey: "selectedIcon") as? String ?? ""
        self.counter = UserDefaults.standard.object(forKey: "counter") as? Int ?? 0
    }
    
}
