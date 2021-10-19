//
//  Person.swift
//  SwiftUI2
//
//  Created by Dave Brunner on 06.10.21.
//

import Foundation
import SwiftUI


class Person: ObservableObject {
    
    let ID = UUID()
    @Published var vorname : String
    @Published var nachname: String
    @Published var geburtstag : Date
    @Published var icon : String
    @Published var lieblingsfarbe : Color

    init (vorname: String, nachname: String, geburtstag: Date, icon: String, lieblingsfarbe: Color) {
        self.vorname = vorname
        self.nachname = nachname
        self.geburtstag = geburtstag
        self.icon = icon
        self.lieblingsfarbe = lieblingsfarbe
    }



}


