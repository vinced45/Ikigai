//
//  SwiftUIView.swift
//  
//
//  Created by Vince Davis on 10/10/22.
//

import SwiftUI

public struct SettingItem: Identifiable, Hashable {
    public var id: UUID = UUID()
    public var icon: String
    public var color: Color
    public var text: String
    public var badge: String
    //public var path: Any?
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

public struct SettingsView: View {
    let infoSection: [SettingItem] = [
        .init(icon: "mic.fill", color: .green, text: "Siri Shortcuts", badge: "New")
    ]
    
    public var body: some View {
        List {
            Section {
                ForEach(infoSection) { setting in
                    NavigationLink(value: setting, label: {
                        HStack {
                            Label(title: {
                                Text(setting.text)
                            }, icon: {
                                IconView(icon: setting.icon, backgroundColor: setting.color)
                            })
                            
                            Spacer()
                            
//                            Text(setting.badge)
//                                .foregroundColor(.white)
//                                .padding(8)
//                                .background(.orange)
//                                .clipShape(Capsule())
                        }
                    })
                }
            }
            
            HStack {
                Spacer()
                VStack {
                    Image(systemName: "house.fill")
                        .font(.largeTitle)
                        .padding(.top)
                    Text("Version 2.3.1")
                }
                Spacer()
            }.listRowBackground(Color.clear)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
