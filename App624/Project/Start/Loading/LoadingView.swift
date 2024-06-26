//
//  LoadingView.swift
//  App624
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("lv")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .padding(.top, 100)
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 100)
            }
        }
    }
}

#Preview {
    LoadingView()
}
