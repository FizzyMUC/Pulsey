//
//  ContentView.swift
//  Pulsey
//
//  Created by Pascal Marter on 26.09.24.
//

import SwiftUI



struct ContentView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            EntryView()
                .tabItem {
                    Image(systemName: "pencil.and.list.clipboard")
                    Text("Entries")
                }
                .tag(0)
                .accentColor(.purple)
            
            TrendsView()
                .tabItem {
                    Image(systemName: "chart.dots.scatter")
                    Text("Trends")
                }
                .tag(1)
                .accentColor(.purple)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(2)
                .accentColor(.purple)
        }
        
    }
}

#Preview {
    ContentView()
}
