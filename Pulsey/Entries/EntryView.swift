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
            List {
                ForEach(bloodValues.items) { item in
                    VStack(alignment: .leading) {
                        VStack {
                            HStack {
                                Text(item.date, format: .dateTime.day().month().year())
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text(item.date, format: .dateTime.hour().minute())
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            
                            HStack {
                                Text("\(item.valueSystolic) / \(item.valueDiastolic)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.title2)
                                Text("Pulse: \(item.pulse)")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .foregroundColor(.secondary)
                            }
                            
                            HStack {
                                Text("\(item.assessment)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.subheadline)
                                Text("\(item.icon)")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            
                        }
                    }
                    
                }
                .onDelete(perform: removeItems)
            }
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
    
    func removeItems(at offsets: IndexSet) {
        bloodValues.items.remove(atOffsets: offsets)
    }
}

#Preview {
    EntryView()
}
