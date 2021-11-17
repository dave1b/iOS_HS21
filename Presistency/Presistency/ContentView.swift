//
//  ContentView.swift
//  Presistency
//
//  Created by Dave Brunner on 09.11.21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @AppStorage("buttonCounter") var counter = 0 /*{
    didSet{
        userDefault?.set(counter, forKey: "counter")
    }
        
    }
    private let userDefault = UserDefaults(suiteName: "group.ch.hslu.ios.persistency")
    */
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest( entity: Person.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Person.name, ascending: true)],
        animation: .default)
    private var personen: FetchedResults<Person>
    
    @FetchRequest( entity: Team.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Team.name, ascending: true)],
        animation: .default)
    private var teams: FetchedResults<Team>

    var body: some View {
        Text("\(counter)")
        NavigationView {
            List {
                ForEach(teams) { team in
                    NavigationLink {
                        Text("Item at \(team.name!)")
                        ForEach(Array(team.contains! as! Set<Person>), id: \.self) { person in
                            Text("Mitglied \(person.name!)")
                        }
                        
                    } label: {
                        Text(team.name ?? "unknown")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addTeam) {
                        Label("Add Team", systemImage: "plus")
                    }
                }
                ToolbarItem {
                    Button(action: addPerson) {
                        Label("Add Person", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
        VStack{
            
        }
    }

    private func addTeam() {
        withAnimation {
            let newTeam = Team(context: viewContext)
            newTeam.name = "Noobs"
            let newPerson1 = Person(context: viewContext)
            newPerson1.name = "Fabio"
            let newPerson2 = Person(context: viewContext)
            newPerson2.name = "Fabian"
            newTeam.addToContains(newPerson1)
            newTeam.addToContains(newPerson2)
            counter += 1
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    
    private func addPerson() {
        withAnimation {
        
            let newItem = Person(context: viewContext)
            newItem.name = "Nicole"
            

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { teams[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
