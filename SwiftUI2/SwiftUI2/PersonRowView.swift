//
//  PersonRowView.swift
//  SwiftUI2
//
//  Created by Dave Brunner on 09.10.21.
//

import SwiftUI

struct PersonRowView: View {
    @Binding var person: Person

    
    
    var body: some View {
       
        
       
            
            
            
            VStack{
                
                NavigationLink(destination: PersonDetailView(person: $person), label: {
                    
                
            HStack{
                //Icon
                Image(person.icon).resizable().frame(width: 50, height: 50, alignment: .center)
                VStack{
                    Text(person.vorname)
                    Text(person.geburtstag, style: .date)
                        
                  
                }
                
                
                
            }
                
            
        
                               
        
        })
    }
}

/*struct PersonRowView_Previews: PreviewProvider {
    static var previews: some View {
        PersonRowView(person: Person(vorname: "Dave", nachname: "Brunner", geburtstag: Date(), icon: "turkey", lieblingsfarbe: Color.blue))
    }
}*/
}
