//
//  StatisticsView.swift
//  Pulsey
//
//  Created by Pascal Marter on 13.10.24.
//

import SwiftUI

struct StatisticsView: View {
    var body: some View {
        NavigationStack {
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
        }
    }
}

#Preview {
    StatisticsView()
}
