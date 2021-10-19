//
//  MyWidget.swift
//  MyWidget
//
//  Created by Dave Brunner on 19.10.21.
//

import WidgetKit
import SwiftUI
import SwiftUIWidgets

struct Provider: TimelineProvider {
   
    
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct MyWidgetEntryView : View {
    let ud = UserDefaults(suiteName: "group.ch.hslu.ios.SwiftUIWidgets")
    
    //ud.value(counter, forKey: "counter")
    // var name  = ud.value(forKey: "selectedIcon")
   
    //var counter2 = ud.value(forKey: "counter")
    // private var i = userDefaults.integer(forKey: "counter")
  
    
    
    var numberOfClicks: Int?
    var selectedIcon: String?
    
    init(){
        numberOfClicks = ud?.value(forKey: "counter") as? Int
        selectedIcon = ud?.value(forKey: "selectedIcon") as? String
    }
    
    
    

    var body: some View {
        
    
        
        HStack{
            Text(String("#Clicks:"))
//            Text("\(print(ud?.value(forKey: "counter")))")
              Text("\(numberOfClicks ?? 0)")
            Text("\(selectedIcon ?? "👾")")
            //Text(any("\(counter2)"))
//            Text("\(UserDefaults.standard.value(forKey: "counter"))")
//            Text(String())
        }
        
    }
}

@main
struct MyWidget: Widget {
    
    
    let kind: String = "MyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MyWidgetEntryView()
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct MyWidget_Previews: PreviewProvider {
    static var previews: some View {
        MyWidgetEntryView()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
