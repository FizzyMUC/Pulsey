//
//  TrendsView.swift
//  Pulsey
//
//  Created by Pascal Marter on 26.09.24.
//

import SwiftUI

struct TrendsView: View {
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
                    Text("Currently no trends available")
                }
            }
            .navigationTitle("Trends")
        }
    }
}

#Preview {
    TrendsView()
}
