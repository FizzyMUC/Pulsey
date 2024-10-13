//
//  BloodValueItem.swift
//  Pulsey
//
//  Created by Pascal Marter on 13.10.24.
//

import Foundation

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
