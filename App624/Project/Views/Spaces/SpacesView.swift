//
//  SpacesView.swift
//  App624
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI

struct SpacesView: View {
    
    @StateObject var viewModel = SpacesViewModel()
    @StateObject var gardenModel = AddViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Spaces")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.spaces, id: \.self) { index in
                            
                            VStack(alignment: .leading, spacing: 12) {
                                
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                                Spacer()
                                
                                HStack {
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        
                                        HStack {
                                            
                                            ForEach(gardenModel.plants.filter{$0.plSpace ?? "" == index}, id: \.self) { plant in
                                                
                                                Image(plant.plPhoto ?? "")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 70, height: 70)
                                            }
                                            
                                            Button(action: {
                                                
                                                viewModel.isAddPlant = true
                                                
                                            }, label: {
                                                
                                                Image(systemName: "plus")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 16, weight: .semibold))
                                                    .frame(width: 70, height: 70)
                                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                                            })
                                        }
                                    }
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 150)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        }
                    }
                }
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddSpace = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 17, weight: .semibold))
                        
                        Text("Create space")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 17, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                })
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddSpace ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddSpace = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddSpace = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Name of space")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Space")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addSpace.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addSpace)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    .padding(1)
                    .padding(.bottom)
                    
                    Button(action: {
                        
                        viewModel.spaces.append(viewModel.addSpace)
                        
                        viewModel.addSpace = ""
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddSpace = false
                            
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(Color.white)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                    })
                    .opacity(viewModel.addSpace.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.addSpace.isEmpty ? true : false)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isAddSpace ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            gardenModel.fetchPlants()
        }
        .sheet(isPresented: $viewModel.isAddPlant, content: {
            
            AddView()
        })
    }
}

#Preview {
    SpacesView()
}
