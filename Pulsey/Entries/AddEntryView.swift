//
//  AddView.swift
//  Pulsey
//
//  Created by Pascal Marter on 26.09.24.
//

import SwiftUI

struct AddEntryView: View {
    // Enable dismissing the sheet after entry is created
    @Environment(\.dismiss) var dismiss
    
    // Setup variables for the new entry
    @State private var date = Date.now
    @State private var valueSystolic: Int = 120
    @State private var valueDiastolic: Int = 80
    @State private var pulse: Int = 60
    @State private var note: String = ""
    @State private var assessment = (string: "", icon: "")
    
    var bloodValues: Entries
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    DatePicker("Date", selection: $date)
                        .datePickerStyle(.automatic)
                }
                Section("Blood pressure") {
                    HStack {
                        Label("Systolic", systemImage: "arrow.up.heart")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.purple)
                        TextField("Systolic", value: $valueSystolic, format: .number)
                            .keyboardType(.decimalPad)
                    }
                    HStack {
                        Label("Diastolic", systemImage: "arrow.down.heart")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.purple)
                        TextField("Diastolic", value: $valueDiastolic, format: .number)
                            .keyboardType(.decimalPad)
                    }
                    
                }
                Section("Pulse") {
                    HStack {
                        Label("Pulse", systemImage: "waveform.path.ecg")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.purple)
                        TextField("Pulse", value: $pulse, format: .number)
                            .keyboardType(.decimalPad)
                    }
                    
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
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        assessment = assessValue(systolic: valueSystolic, diastolic: valueDiastolic)
                        let item = BloodValueItem(date: date, valueSystolic: valueSystolic, valueDiastolic: valueDiastolic, pulse: pulse, note: note, assessment: assessment.string, icon: assessment.icon)
                        
                        // Append new item to entries, then sort the whole array by date
                        bloodValues.items.append(item)
                        bloodValues.items.sort { $0.date > $1.date }
                        
                        dismiss()
                    }
                }
            }
        }
    }
    
    func assessValue(systolic: Int, diastolic: Int) -> (String, String) {
        // Function always returns a description of the assessment plus a corresponding icon in a tuple
        if systolic >= 180 || diastolic >= 110 {
            return ("Hypertension, Grade 3", "😵")
        }
        else if systolic >= 160 || diastolic >= 100 {
            return ("Hypertension, Grade 2", "😞")
        }
        else if systolic >= 140 || diastolic >= 90 {
            return ("Hypertension, Grade 1", "😕")
        }
        else if systolic >= 130 || diastolic >= 85 {
            return ("High normal", "😊")
        }
        else if systolic <= 129 || diastolic >= 80 {
            return ("Normal", "😄")
        }
        else if systolic < 120 && diastolic < 80 {
            return ("Optimal", "🤩")
        }
        else {
            return ("n/a", "😶")
        }
    }
}

#Preview {
    AddEntryView(bloodValues: Entries())
}
