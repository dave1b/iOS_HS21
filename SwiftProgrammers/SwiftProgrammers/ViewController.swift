//
//  ViewController.swift
//  SwiftProgrammers
//
//  Created by Dave Brunner on 21.09.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let label = UILabel (frame: CGRect (x: 20, y: 20, width: 500, height: 100))
        label.text = "Mitstudierende im Modul iOS"
        label.textColor = UIColor.orange
        label.font = UIFont(name: "Times New Roman", size: 32
        )
        self.view.addSubview(label)
        
        self.view.backgroundColor = UIColor.black
        
        
        func addLabel(name: String, position: Int) {
            
            var y : Int
            var x : Int
            if(position%2 == 0) {
                x = 50
            } else {
                x = 300
            }
            y = 100 + position*20
                
            let label  = UILabel (frame: CGRect (x: x, y: y, width: 300, height: 100))
            label.text = name
            
            switch (position%3) {
            case 0:
                label.textColor = UIColor.green
            case 1:
                label.textColor = UIColor.white
            case 2:
                label.textColor = UIColor.red
            default:
                break
            }
            self.view.addSubview(label)
        }
        
        
        func addMembers(userPersonData: Bool){ //DataProvider: DataProvider,
            
            if(userPersonData == false){
        for i in 0...DataProvider.memberNames.count-1 {
            addLabel(name: DataProvider.memberNames[i], position: i)
        }
        }
         else {
            for i in 0...DataProvider.memberPersons.count-1 {
                let x = 50
                let y = 100 + i*20
                let labelFirstName  = UILabel (frame: CGRect (x: x, y: y, width: 300, height: 100))
                let labelLastName  = UILabel (frame: CGRect (x: x+100, y: y, width: 300, height: 100))
                let labelPLZ = UILabel (frame: CGRect (x: x+200, y: y, width: 300, height: 100))
                labelFirstName.text = DataProvider.memberPersons[i].firstName
                labelLastName.text = DataProvider.memberPersons[i].lastName
                labelPLZ.text = String(DataProvider.memberPersons[i].plz)
                labelFirstName.textColor = UIColor.green
                labelLastName.textColor = UIColor.green
                labelPLZ.textColor = UIColor.green
                self.view.addSubview(labelFirstName)
                self.view.addSubview(labelLastName)
                self.view.addSubview(labelPLZ)
            }
            }
        }
        
        //let memberNames = ["Dave", "Fabio", "Daniele", "Elio", "Nicolas","Dave", "Tim", "Jan", "Roger", "Matthias", "Marco", "Thomas", "Felix", "Regina", "Adrian", "Marinus", "Nick", "Raphael", "Ruben", "Hannes", "Sandro", "Markus", "Staphan", "Dario"]
        //let memberPersons = [Person(firstName: "Dave", lastName: "Brunner", plz: 6204), Person(firstName: "Daniele", lastName: "Muheim", plz: 4392), Person(firstName: "Elio", lastName: "DiPuma", plz: 4344), Person(firstName: "Fabio", lastName: "Stecher", plz: 4343), Person(firstName: "Nicolas", lastName: "Wiedmer", plz: 3828),Person(firstName: "Dave", lastName: "Brunner", plz: 6204), Person(firstName: "Daniele", lastName: "Muheim", plz: 5292), Person(firstName: "Elio", lastName: "DiPuma", plz: 4344), Person(firstName: "Fabio", lastName: "Stecher", plz: 4343), Person(firstName: "Nicolas", lastName: "Wiedmer", plz: 3828),Person(firstName: "Dave", lastName: "Brunner", plz: 6204), Person(firstName: "Daniele", lastName: "Muheim", plz: 2192), Person(firstName: "Elio", lastName: "DiPuma", plz: 4344), Person(firstName: "Fabio", lastName: "Stecher", plz: 4343), Person(firstName: "Nicolas", lastName: "Wiedmer", plz: 7294),Person(firstName: "Dave", lastName: "Brunner", plz: 6204), Person(firstName: "Daniele", lastName: "Muheim", plz: 4392), Person(firstName: "Elio", lastName: "DiPuma", plz: 4344), Person(firstName: "Fabio", lastName: "Stecher", plz: 7463), Person(firstName: "Nicolas", lastName: "Wiedmer", plz: 9123),Person(firstName: "Dave", lastName: "Brunner", plz: 6204), Person(firstName: "Daniele", lastName: "Muheim", plz: 4392), Person(firstName: "Elio", lastName: "DiPuma", plz: 4344), Person(firstName: "Fabio", lastName: "Stecher", plz: 4343), Person(firstName: "Nicolas", lastName: "Wiedmer", plz: 3628)]
        //let DataProvider = DataProvider(memberNames: memberNames, memberPersons: memberPersons)
        addMembers(userPersonData: true) //DataProvider: DataProvider,

    }


}

