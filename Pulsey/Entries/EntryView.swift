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
                
                // FIXME: When presenting AddEntryView, the values from the last entry shall be shown in the textfield
                //AddEntryView(bloodValues: bloodValues, newValueSystolic: bloodValues.items[bloodValues.items.count - 1].valueSystolic ?? 120, newValueDiastolic: bloodValues.items[bloodValues.items.count - 1].valueDiastolic ?? 80)
            }
        }
    }
}

#Preview {
    EntryView()
}
