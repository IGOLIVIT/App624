//
//  Not.swift
//  App624
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("Not")
                    .resizable()
                
                VStack {
                    
                    Text("Don't miss anything important")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                        .frame(width: 290)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    HStack {
                        
                        Button(action: {
                            
                            status = true
                            
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
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(5)
                        .background(Circle().fill(.black))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    Not()
}
