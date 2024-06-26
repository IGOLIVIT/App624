//
//  SettingsView.swift
//  App624
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI
import StoreKit
import CoreData

struct SettingsView: View {
    
    @StateObject var viewModel = SettingsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 14) {
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/e5fd75ff-55d8-47e7-b09b-16e006f49260") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray.opacity(0.6))
                                    .font(.system(size: 18, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        })
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Rate app")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray.opacity(0.6))
                                    .font(.system(size: 18, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isReset = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "gearshape.arrow.triangle.2.circlepath")
                                    .foregroundColor(Color.red)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Reset progress")
                                    .foregroundColor(.red)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray.opacity(0.6))
                                    .font(.system(size: 18, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        })
                    }
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isReset ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isReset = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isReset = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Reset progress")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to reset all progress?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteAllData()
                        viewModel.spaces.removeAll()
                        viewModel.spaces = []
          
                        withAnimation(.spring()) {
                            
                            viewModel.isReset = false
                        }
                                
                    }, label: {
                        
                        Text("Reset")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isReset = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isReset ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}
