//
//  TabBar.swift
//  App624
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in

                    Button(action: {
                        
                        selectedTab = index
                        
                    }, label: {
                        
                        if index.rawValue == "Add" {
                            
                            VStack(alignment: .center, spacing: 8, content: {
                                
                                Image(index.rawValue)
                                    .frame(width: 25, height: 25)
                                
                                
                            })
                            .frame(maxWidth: .infinity)
                            
                        } else {
                            
                            VStack(alignment: .center, spacing: 8, content: {
                                
                                Image(index.rawValue)
                                    .renderingMode(.template)
                                    .foregroundColor(selectedTab == index ? Color("prim") : Color.gray.opacity(0.4))
                                    .frame(width: 25, height: 25)
                                
                                
                            })
                            .frame(maxWidth: .infinity)
                        }
                    })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 58)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Garden = "Garden"
    
    case Spaces = "Spaces"
    
    case Settings = "Settings"
            
    case Add = "Add"
    
}
