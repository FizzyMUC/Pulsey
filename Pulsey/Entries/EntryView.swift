//
//  EntryView.swift
//  Pulsey
//
//  Created by Pascal Marter on 26.09.24.
//

import SwiftUI

struct EntryView: View {
    @State private var showingAddView = false
    
    // Create instance of the class Entries
    @State private var bloodValues = Entries()
    
    var body: some View {
        
        NavigationStack {
            EntryListView()
            .navigationTitle("Pulsey")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                Button("Add Entry", systemImage: "plus") {
                    showingAddView = true
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddEntryView(bloodValues: bloodValues)
            }
        }
    }
}

#Preview {
    EntryView()
}
