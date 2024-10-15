//
//  EntryItemView.swift
//  Pulsey
//
//  Created by Pascal Marter on 15.10.24.
//

import SwiftUI

struct EntryItemView: View {
    
    let item: BloodValueItem
    
    var body: some View {
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
                        .font(.title)
                    Text("Pulse: \(item.pulse)")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("\(item.assessment)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.subheadline)
                    Text("\(item.icon)")
                        .frame(alignment: .trailing)
                }
                
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.gray.gradient.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}


#Preview {
    let item = BloodValueItem(date: Date.now, valueSystolic: 130, valueDiastolic: 80, pulse: 66, note: "", medicationUsed: true, assessment: "High normal", icon: "😍")
    EntryItemView(item: item)
}
