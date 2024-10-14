//
//  SettingsView.swift
//  Pulsey
//
//  Created by Pascal Marter on 26.09.24.
//

import SwiftUI

struct SettingsView: View {
    //@Environment(\.colorScheme) var colorScheme
    @State private var displayMode = "Automatic"
    
    var body: some View {
        NavigationStack {
            List {
                
                Section("App options") {
                    
                    NavigationLink {
                        AccentColorView()
                    } label: {
                        Label {
                            Text("Change accent color")
                        } icon: {
                            Image(systemName: "paintpalette")
                                .foregroundStyle(.purple)
                        }
                    }
                    
                    // TODO: Display Mode to be enabled
                    Picker(selection: $displayMode) {
                        Text("Automatic").tag("Automatic")
                        Text("Dark").tag("Dark")
                        Text("Light").tag("Light")
                    } label: {
                        Label {
                            Text("Appearance")
                        } icon: {
                            Image(systemName: "circle.lefthalf.filled")
                                .foregroundStyle(.purple)
                        }
                    }
                    .pickerStyle(.automatic)
                    
                    NavigationLink {
                        NotificationsView()
                    } label: {
                        Label {
                            Text("Push Notifications")
                        } icon: {
                            Image(systemName: "bell")
                                .foregroundStyle(.purple)
                        }
                    }
                    
                    NavigationLink {
                        Text("This is where Apple Health integration will be")
                    } label: {
                        Label {
                            Text("Connect to Apple Health")
                        } icon: {
                            Image(systemName: "heart")
                                .foregroundStyle(.purple)
                        }
                    }
                    
                }
                
                Section("Support Pulsey") {
                    
                    Label {
                        Text("Rate Pulsey on the AppStore")
                    } icon: {
                        Image(systemName: "star")
                            .foregroundStyle(.purple)
                    }
                    Label {
                        Text("Support future development")
                    } icon: {
                        Image(systemName: "giftcard")
                            .foregroundStyle(.purple)
                    }
                    Label {
                        Text("Share with friends")
                    } icon: {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundStyle(.purple)
                    }
                    Link(destination: URL(string: "https://x.com/pulsey_app")!, label: {
                        Label {
                            Text("Follow us on X")
                        } icon: {
                            Image(systemName: "point.3.connected.trianglepath.dotted")
                                .foregroundStyle(.purple)
                        }
                    })
                    
                }
                
                Section("Info") {
                                        
                    Link(destination: URL(string: "https://www.dancingfrogs.de/pulsey")!, label: {
                        Label {
                            Text("About Pulsey")
                        } icon: {
                            Image(systemName: "info.circle")
                                .foregroundStyle(.purple)
                        }
                    })
                    NavigationLink {
                        VersionInfoView()
                    } label: {
                        Label {
                            Text("Version info")
                        } icon: {
                            Image(systemName: "info.bubble.fill")
                                .foregroundStyle(.purple)
                        }
                    }
                    Link(destination: URL(string: "mailto:pulsey-app@dancingfrogs.de")!, label: {
                        Label {
                            Text("Report a bug")
                        } icon: {
                            Image(systemName: "ladybug.circle")
                                .foregroundStyle(.purple)
                        }
                    })
                    Link(destination: URL(string: "mailto:pulsey-app@dancingfrogs.de")!, label: {
                        Label {
                            Text("Request support")
                        } icon: {
                            Image(systemName: "envelope.circle")
                                .foregroundStyle(.purple)
                        }
                    })
                }
            }
            .navigationTitle("Preferences")
        }
    }
}

#Preview {
    SettingsView()
}
