//
//  VersionInfoView.swift
//  Pulsey
//
//  Created by Pascal Marter on 27.09.24.
//

import SwiftUI

struct VersionInfoView: View {
    var body: some View {
        List {
            HStack {
                Text("Version")
                Spacer()
                
                // TODO: Get Version number from Bundle
                if let text = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
                    Text(text)
                        .foregroundStyle(.secondary)
                }
            }
            HStack {
                Text("Build")
                Spacer()
                
                // TODO: Get Build number from Bundle
                if let text = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
                    Text(text)
                        .foregroundStyle(.secondary)
                }
                    
            }
        }
    }
}

#Preview {
    VersionInfoView()
}
