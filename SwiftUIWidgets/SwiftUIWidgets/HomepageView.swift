//
//  HomepageView.swift
//  SwiftUIWidgets
//
//  Created by Dave Brunner on 19.10.21.
//

import SwiftUI

struct HomepageView: View {
    var body: some View {
        VStack{
        Text("Hello, Widget").font(.custom("Helvetic Neue", size: 30)).bold()
            .padding()
        
        Text("#Clicks: ")
        Text("What do you want?")
            
            
        
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
