//
//  Constants.swift
//  SwiftUIWidgets
//
//  Created by Dave Brunner on 19.10.21.
//

import Foundation
import WidgetKit
 
class MyGlobalValues: ObservableObject  {
    private let userDefault = UserDefaults(suiteName: "group.ch.hslu.ios.SwiftUIWidgets")
    
    
    @Published var backGroundColor = "Color.gray"
    @Published var counter: Int = 0 {
        didSet{
            userDefault?.set(counter, forKey: "counter")
            //self.counter = UserDefaults.standard.object(forKey: "counter") as? Int ?? 0
            WidgetCenter.shared.reloadAllTimelines()
        //WidgetCenter.shared.reloadTimelines(ofKind: "MyWidget")
    }
    }
    
    @Published var iconOptions = ["☮️","🎶","🐰","💎"]
    @Published var selectedIcon : String = "☮️"{
        didSet{
            userDefault?.set(selectedIcon, forKey: "selectedIcon")
            //WidgetCenter.shared.reloadAllTimelines()
           // self.selectedIcon = UserDefaults.standard.object(forKey: "selectedIcon") as? String ?? ""
        WidgetCenter.shared.reloadTimelines(ofKind: "MyWidget")
    }
    }
    init() {
        self.backGroundColor = UserDefaults.standard.object(forKey: "backGroundColor") as? String ?? ""
        //self.iconOptions = UserDefaults.standard.object(forKey: "iconOptions") as? [String] ?? [""]
    }
}
