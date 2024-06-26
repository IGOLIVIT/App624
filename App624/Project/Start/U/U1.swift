//
//  U1.swift
//  App624
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("U1")
                    .resizable()
                
                VStack {
                    
                    Text("Build a collection of your plants")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                        .frame(width: 250)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    HStack {
                        
                        NavigationLink(destination: {
                            
                            Reviews()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 170, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                        
                        Spacer()
                    }
                    
                    Spacer()

                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 260)
                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    U1()
}
