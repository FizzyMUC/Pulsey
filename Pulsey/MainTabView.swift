//
//  TabView.swift
//  Pulsey
//
//  Created by Pascal Marter on 14.10.24.
//

import SwiftUI

struct MainTabView: View {
    
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

            
            StatisticsView()
                .tabItem {
                    Image(systemName: "chart.dots.scatter")
                    Text("Statistics")
                }
                .tag(1)
                .accentColor(.purple)
            
            TrendsView()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Trends")
                }
                .tag(2)
                .accentColor(.purple)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(3)
                .accentColor(.purple)
        }
    }
}

#Preview {
    MainTabView()
}
