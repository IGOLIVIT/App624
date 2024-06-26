//
//  Reviews.swift
//  App624
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("Reviews")
                    .resizable()
                
                VStack {
                    
                    Text("Rate our app in the AppStore")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                        .frame(width: 250)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    HStack {
                        
                        NavigationLink(destination: {
                            
                            Not()
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
