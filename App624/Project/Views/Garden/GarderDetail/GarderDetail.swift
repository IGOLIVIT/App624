//
//  GarderDetail.swift
//  App624
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI

struct GarderDetail: View {
    
    @StateObject var viewModel: AddViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            router.wrappedValue.dismiss()
                        }
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                        
                        Text("Back")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                    })
                    
                    Spacer()
                    
                    Text(viewModel.selectedPlant?.plName ?? "")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
 
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = true
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 15, weight: .regular))
                    })

                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Image(viewModel.selectedPlant?.plPhoto ?? "")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 150)
                    
                    VStack {
                        
                        Text(viewModel.selectedPlant?.plName ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .semibold))
                        
                        Text(viewModel.selectedPlant?.plType ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 11, weight: .regular))
                            .padding(3)
                            .padding(.horizontal, 3)
                            .background(RoundedRectangle(cornerRadius: 4).fill(.red))
                        
                        HStack {
                            
                            Text(viewModel.selectedPlant?.plSpace ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 12, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(RoundedRectangle(cornerRadius: 13).fill(.gray.opacity(0.2)))
                            
                            Text(viewModel.selectedPlant?.plTemp ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 12, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(RoundedRectangle(cornerRadius: 13).fill(.gray.opacity(0.2)))
                        }
                        
                        HStack {
                            
                            Text(viewModel.selectedPlant?.plSoil ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 12, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(RoundedRectangle(cornerRadius: 13).fill(.gray.opacity(0.2)))
                            
                            Text(viewModel.selectedPlant?.plSun ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 12, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(RoundedRectangle(cornerRadius: 13).fill(.gray.opacity(0.2)))
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deletePlant(withPlName: viewModel.selectedPlant?.plName ?? "", completion: {
                            
                            viewModel.fetchPlants()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isDetail = false
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
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
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    GarderDetail(viewModel: AddViewModel())
}
