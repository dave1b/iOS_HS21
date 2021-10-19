//
//  ContentView.swift
//  SwiftUI2
//
//  Created by Dave Brunner on 06.10.21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataManager: DataManager = DataManager()
    @State var modal = false
    
    var body: some View {
        
        
        
        NavigationView{
            
            VStack(alignment: .leading){
                Text("Contacts").font(.system(size: 40, weight: .regular)).padding(20)
                
                Button("Create new"){
                    modal = true
                }.padding(10).foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(20)
//                    .buttonStyle(BorderlessButtonStyle())
                    .sheet(isPresented: $modal, content: {CreatePersonView(dataManager: dataManager)})
                
                
                
                /* NavigationLink("Create new", destination: PersonDetailView(person: Person(vorname: "", nachname: "", geburtstag: Date(), icon: "", lieblingsfarbe: Color.blue))))*/
                
                
                Form{
                    
                    
                    ForEach($dataManager.personen, id:\.ID){
                        
                        person in
                        PersonRowView(person: person)
                        
                        
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
