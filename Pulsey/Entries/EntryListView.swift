//
//  EntryListView.swift
//  Pulsey
//
//  Created by Pascal Marter on 13.10.24.
//

import SwiftUI

struct EntryListView: View {
    
    let bloodValues: Entries
    
    var body: some View {
        List {
            ForEach(bloodValues.items) { item in
                NavigationLink {
                    // EditEntryView(bloodValues: bloodValues)
                } label: {
                    EntryItemView(item: item)
//                    VStack(alignment: .leading) {
//                        VStack {
//                            HStack {
//                                Text(item.date, format: .dateTime.day().month().year())
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                Text(item.date, format: .dateTime.hour().minute())
//                                    .frame(maxWidth: .infinity, alignment: .trailing)
//                            }
//                            .font(.caption)
//                            .foregroundStyle(.secondary)
//                            
//                            HStack {
//                                Text("\(item.valueSystolic) / \(item.valueDiastolic)")
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                    .font(.title2)
//                                Text("Pulse: \(item.pulse)")
//                                    .frame(maxWidth: .infinity, alignment: .trailing)
//                                    .foregroundColor(.secondary)
//                            }
//                            
//                            HStack {
//                                Text("\(item.assessment)")
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                    .font(.subheadline)
//                                Text("\(item.icon)")
//                                    .frame(alignment: .trailing)
//                            }
//                            
//                        }
//                    }
                }
            }
            .onDelete(perform: removeItems)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        bloodValues.items.remove(atOffsets: offsets)
    }
}

#Preview {
    let bloodValues = Entries()
    EntryListView(bloodValues: bloodValues)
}
