//
//  ContentView.swift
//  AppCounter
//
//  Created by Layon Fonseca on 04/03/22.
//

import SwiftUI

class Counter: ObservableObject{
    
    @Published var day = 0
    @Published var hours = 0
    @Published var minutes = 0
    @Published var seconds = 0
    
    var selectedDate = Date()
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            timer in
            
            let calendar = Calendar.current
            let components = calendar.dateComponents([
                .year, .day, .month, .hour, .minute, .second], from: Date())
            let currentDate = calendar.date(from: components)
            print(currentDate)
            
            var eventDateComponents = DateComponents()
            eventDateComponents.year = 2022
            eventDateComponents.month = 12
            eventDateComponents.day = 25
            eventDateComponents.hour = 11
            eventDateComponents.minute = 0
            eventDateComponents.second = 0
            
            let eventDate = calendar.date(from: eventDateComponents)
            print(eventDate)
            
            let timeLeft = calendar.dateComponents([ .day, .hour, .minute, .second], from: currentDate!, to: eventDate!)
            
            self.day = timeLeft.day ?? 0
            self.hours = timeLeft.hour ?? 0
            self.minutes = timeLeft.minute ?? 0
            self.seconds = timeLeft.second ?? 0
        }
    }
}

struct ContentView: View {
    
    @StateObject var counter = Counter()
    
    var body: some View {
        VStack {
            Text("Hello iOS").padding(20)
            HStack {
                Text("\(counter.day) dias")
                Text("\(counter.seconds) horas")
                Text("\(counter.minutes) min")
                Text("\(counter.seconds) seg")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
