//
//  CreatePersonView.swift
//  SwiftUI2
//
//  Created by Dave Brunner on 10.10.21.
//

import SwiftUI

struct CreatePersonView: View {
    @State var person = Person(vorname: "", nachname: "", geburtstag: Date(), icon: "", lieblingsfarbe: Color.white)
    @ObservedObject var dataManager: DataManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            PersonDetailView(person: $person)
                .toolbar{
                    ToolbarItem(placement: .primaryAction){
                        Button("Speichern"){
                            dataManager.personen.append(person)
                            dismiss()
                        }
                    }
                    ToolbarItem(){
                        Button("Abbrechen"){
                            dismiss()
                        }
                    }
                }
            
            
            
            
        }
    }
    
}

/*struct CreatePersonView_Previews: PreviewProvider {
 static var previews: some View {
 CreatePersonView()
 }
 }*/
