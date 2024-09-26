//
//  SettingsView.swift
//  Pulsey
//
//  Created by Pascal Marter on 26.09.24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                
                Section("Preferences") {
                    
                    Label("Change accent color", systemImage: "paintpalette")
                    
                }
                
                Section("Support Pulsey") {
                    
                    Label("Rate the app in the AppStore", systemImage: "star")
                    Label("Support future development", systemImage: "giftcard")
                    Label("Share with friends", systemImage: "square.and.arrow.up")
                    Label("Follow us on X", systemImage: "point.3.connected.trianglepath.dotted")
                    
                }
                
                Section("Info") {
                                        
                    Link(destination: URL(string: "https://www.dancingfrogs.de/pulsey")!, label: {
                        Label("About Pulsey", systemImage: "info.circle")
                    })
                    Label("Report a bug", systemImage: "ladybug.circle")
                    Label("Request support", systemImage: "envelope.circle")
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
