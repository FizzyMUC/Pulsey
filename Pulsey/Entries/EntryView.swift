//
//  EntryView.swift
//  Pulsey
//
//  Created by Pascal Marter on 26.09.24.
//

import SwiftUI

struct BloodValueItem: Identifiable, Codable {
    var id = UUID()
    let date: Date
    let valueSystolic: Int
    let valueDiastolic: Int
    let pulse: Int
    let note: String
    let assessment: String
    let icon: String
}

@Observable
class Entries {
    var items = [BloodValueItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        // try and decode data from UserDefaults
        //[ExpenseItems].self refers to the type itself, not to an instance
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([BloodValueItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        // If loading fails - no data exists - , create empty array
        items = []
    }
}

struct EntryView: View {
    @State private var showingAddView = false
    
    // Create instance of the class
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
                AddView(bloodValues: bloodValues)
            }
        }
    }
}

#Preview {
    EntryView()
}
