//
//  StatisticsView.swift
//  Pulsey
//
//  Created by Pascal Marter on 13.10.24.
//

import SwiftUI
import Charts

struct heartValue: Identifiable {
    let id = UUID()
    let date: Date
    let valueSystolic: Int
    let valueDiastolic: Int
}

struct StatisticsView: View {
    
    @State private var statisticsAvailable = true
    
    // Test Values
    let heartValues: [heartValue] = [
        .init(date: Date.from(year: 2024, month: 09, day: 10), valueSystolic: 120, valueDiastolic: 80),
        .init(date: Date.from(year: 2024, month: 09, day: 14), valueSystolic: 135, valueDiastolic: 90),
        .init(date: Date.from(year: 2024, month: 09, day: 16), valueSystolic: 145, valueDiastolic: 70),
        .init(date: Date.from(year: 2024, month: 09, day: 28), valueSystolic: 180, valueDiastolic: 110),
        .init(date: Date.from(year: 2024, month: 10, day: 01), valueSystolic: 150, valueDiastolic: 80),
        .init(date: Date.from(year: 2024, month: 10, day: 05), valueSystolic: 145, valueDiastolic: 90),
        .init(date: Date.from(year: 2024, month: 10, day: 09), valueSystolic: 145, valueDiastolic: 85),
        .init(date: Date.from(year: 2024, month: 10, day: 14), valueSystolic: 130, valueDiastolic: 80)
    ]
    
    var body: some View {
        NavigationStack {
            
            if statisticsAvailable == false {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 200)
                        .foregroundStyle(.regularMaterial)
                    VStack {
                        Image(systemName: "heart.slash")
                            .foregroundStyle(.secondary)
                            .imageScale(.large)
                        Text("Currently no statistics available")
                    }
                }
                .navigationTitle("Statistics")
                
            } else {
                ScrollView {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: .infinity, height: 250)
                            .foregroundStyle(.gray.gradient.opacity(0.1))
                            .containerRelativeFrame(.horizontal) { length, axis in
                                return length * 0.95
                            }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Recent heart rate values")
                            Text("Total: \(heartValues.count) values")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Chart {
                                RuleMark(y: .value("Systolic", 130))
                                    .foregroundStyle(.gray.opacity(0.5))
                                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                                
                                RuleMark(y: .value("Diastolic", 70))
                                    .foregroundStyle(.gray.opacity(0.5))
                                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                                
                                ForEach(heartValues) { heartValue in
                                    LineMark(x: .value("Day", heartValue.date, unit: .day), y: .value("Systolic", heartValue.valueSystolic), series: .value("systolic", "Systolic"))
                                        .foregroundStyle(.purple.gradient.opacity(1))
                                    LineMark(x: .value("Day", heartValue.date, unit: .day), y: .value("Diastolic", heartValue.valueDiastolic), series: .value("diastolic", "Diastolic"))
                                        .foregroundStyle(.purple.gradient.opacity(0.7))
                                }
                            }
                            .frame(height: 180)
                            .chartYScale(domain: 50...200)
                        }
                        .padding(20)
                    }
                }
                .navigationTitle("Statistics")
            }
            
        }
        
    }
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}

#Preview {
    StatisticsView()
}
