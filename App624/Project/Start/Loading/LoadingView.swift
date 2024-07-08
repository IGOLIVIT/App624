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
            
            Color.white
                .ignoresSafeArea()

            VStack {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)

            }
            
            VStack {
                
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 100)
            }
            .padding()
        }
    }
}

#Preview {
    LoadingView()
}
