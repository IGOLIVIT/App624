//
//  GardenView.swift
//  App624
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI

struct GardenView: View {
    
    @StateObject var viewModel = AddViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("My garden")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                if viewModel.plants.isEmpty {
                    
                    VStack(spacing: 15) {
                        
                        Image("empty")
                        
                        Text("Your garden is empty")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("Add the first plant!")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.plants, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedPlant = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading) {
                                            
                                            Text(index.plName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15, weight: .semibold))
                                            
                                            Text(index.plType ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 11, weight: .regular))
                                        }
                                        .padding(10)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.black.opacity(0.25)))
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 150)
                                    .background(
                                    
                                        Image(index.plPhoto ?? "")
                                            .resizable()
                                    )
                                })
                            }
                        })
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchPlants()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            GarderDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    GardenView()
}
