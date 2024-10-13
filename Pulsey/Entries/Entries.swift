//
//  Entries.swift
//  Pulsey
//
//  Created by Pascal Marter on 13.10.24.
//

import Foundation

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
