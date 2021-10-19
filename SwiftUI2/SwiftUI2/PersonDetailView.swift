//
//  PersonDetailView.swift
//  SwiftUI2
//
//  Created by Dave Brunner on 09.10.21.
//

import SwiftUI

struct PersonDetailView: View {
    @Binding var person: Person
   
    
    
    var body: some View {
        
        Form{
            VStack(alignment:.leading, spacing: 20){
                
                TextField("Vorname", text: $person.vorname)
                
                TextField("Nachname", text: $person.nachname)
                
                DatePicker("Geburtstag", selection: $person.geburtstag,displayedComponents: .date)
                
                HStack{
                    ColorPicker("Lieblingsfarbe", selection: $person.lieblingsfarbe)
                }
                HStack{
                    /*Picker(selection: $person.icon)
                    ForEach*/
                    TextField("Icon:", text: $person.icon)
                    
                    Image(person.icon).resizable().frame(width: 40, height: 40, alignment: .center)
                }
                
            }
        }
        
        
  
}
}
/*struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(Person: person)
    }
}*/
