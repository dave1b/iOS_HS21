//
//  DataManager.swift
//  SwiftUI2
//
//  Created by Dave Brunner on 06.10.21.
//

import Foundation
import SwiftUI



class DataManager: ObservableObject  {
    
    @Published var personen : [Person] = [Person(vorname: "Dave", nachname: "Brunner", geburtstag: Date(), icon: "turkey", lieblingsfarbe: Color.blue),Person(vorname: "Fabio", nachname: "Stecher", geburtstag: Date(), icon: "clown", lieblingsfarbe: Color.blue),Person(vorname: "Daniele", nachname: "Mäller", geburtstag: Date(), icon: "cry", lieblingsfarbe: Color.blue)]
    
    func addPerson(person: Person){
        personen.append(person)
    }
    



    
}
