//
//  ContentView.swift
//  App624
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Garden

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {

                        GardenView()
                            .tag(Tab.Garden)

                        SpacesView()
                            .tag(Tab.Spaces)

                        SettingsView()
                            .tag(Tab.Settings)
                        
                        AddView()
                            .tag(Tab.Add)
                        
                        
                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
