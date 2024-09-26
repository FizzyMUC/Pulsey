//
//  AddView.swift
//  Pulsey
//
//  Created by Pascal Marter on 26.09.24.
//

import SwiftUI

struct AddView: View {
    // Enable dismissing the sheet after entry is created
    @Environment(\.dismiss) var dismiss
    
    // Setup variables for the new entry
    @State private var date = Date.now
    @State private var valueSystolic: Int = 120
    @State private var valueDiastolic: Int = 80
    @State private var pulse: Int = 60
    @State private var note: String = ""
    @State private var assessment: String = ""
    
    var bloodValues: Entries
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text(date, format: .dateTime.day().month().year().hour().minute().second().minute())
                }
                Section("Blood pressure") {
                    TextField("Systolic", value: $valueSystolic, format: .number)
                        .keyboardType(.decimalPad)
                    TextField("Diastolic", value: $valueDiastolic, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section("Pulse") {
                    TextField("Pulse", value: $pulse, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section("Notes") {
                    TextField("Notes", text: $note, axis: .vertical)
                        .lineLimit(4, reservesSpace: true)
                        .keyboardType(.default)
                }
            }
            .navigationTitle("Add new blood values")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Save") {
                    assessment = assessValue(diastolic: valueDiastolic, systolic: valueSystolic)
                    let item = BloodValueItem(date: date, valueSystolic: valueSystolic, valueDiastolic: valueDiastolic, pulse: pulse, note: note, assessment: assessment)
                    
                    // Add new item as first entry in the array
                    bloodValues.items.insert(item, at: 0)
                    dismiss()
                }
            }
        }
    }
    
    func assessValue(diastolic: Int, systolic: Int) -> String {
        if diastolic > 180 && systolic > 110 {
            return "Hypertension, Grade 3"
        }
        else if diastolic > 159 && systolic > 99 {
            return "Hypertension, Grade 2"
        }
        else if diastolic > 139 && systolic > 89 {
            return "Hypertension, Grade 1"
        }
        else if diastolic > 129 && systolic > 84 {
            return "High normal"
        }
        else if diastolic > 119 && systolic > 79 {
            return "Normal"
        }
        else if diastolic < 120 && systolic < 80 {
            return "Optimal"
        }
        else {
            return "n/a"
        }
    }
}

#Preview {
    AddView(bloodValues: Entries())
}
