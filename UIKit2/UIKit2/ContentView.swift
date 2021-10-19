//
//  ContentView.swift
//  UIKit2
//
//  Created by Dave Brunner on 15.10.21.
//


import SwiftUI


struct ContentView: View {
    @State var modal = false
    var body: some View {
        Text("SwiftUIView").bold().font(.system(size: 60)).offset(x: 0, y: -250)
        Button("Show XibView") {
            modal = true
        }.sheet(isPresented: $modal, onDismiss: {modal = false}, content: {
            UIKitVC()
        })    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
