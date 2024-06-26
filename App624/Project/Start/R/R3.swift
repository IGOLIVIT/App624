//
//  R3.swift
//  App624
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("R3")
                    .resizable()
                
                VStack {
                    
                    Text("Monitor plants from your smartphone")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                        .frame(width: 270)
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
        }
    }
}

#Preview {
    R3()
}
