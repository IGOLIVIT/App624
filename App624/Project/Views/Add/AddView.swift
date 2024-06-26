//
//  AddView.swift
//  App624
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI

struct AddView: View {
    
    @StateObject var viewModel = AddViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Text("New plant")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {

                        viewModel.plSpace = viewModel.currentSpace
                        viewModel.plPhoto = viewModel.currentPhoto
                        viewModel.plSun = viewModel.currentSun
                        
                        viewModel.addPlant()
                        
                        viewModel.currentSun = ""
                        viewModel.currentPhoto = ""
                        viewModel.currentSpace = ""
                        
                        viewModel.plName = ""
                        viewModel.plType = ""
                        viewModel.plTemp = ""
                        viewModel.plSoil = ""
                        
                        viewModel.fetchPlants()

                        withAnimation(.spring()) {
                            
                            router.wrappedValue.dismiss()
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 15, weight: .regular))
                    })
                    .opacity(viewModel.plName.isEmpty || viewModel.plType.isEmpty || viewModel.currentSun.isEmpty || viewModel.plTemp.isEmpty || viewModel.plSoil.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.plName.isEmpty || viewModel.plType.isEmpty || viewModel.currentSun.isEmpty || viewModel.plTemp.isEmpty || viewModel.plSoil.isEmpty ? true : false)
                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Menu(content: {
                        
                        ForEach(viewModel.photos, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentPhoto = index
                                
                            }, label: {
                                
                                Image(index)
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.currentPhoto.isEmpty {
                            
                            Image("emptyPhoto")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                                .frame(maxWidth: .infinity)
                                .frame(height: 160)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.15)))
                            
                        } else {
                            
                            Image(viewModel.currentPhoto)
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 160)
                        }
                    })
                    
                    VStack(alignment: .leading) {
                        
                        Text("Name of the plant")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.plName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.plName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                        .padding(1)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Plant type")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.plType.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.plType)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                        .padding(1)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    VStack(alignment: .leading) {
                        
                        Text("Space")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {
                                
                                ForEach(viewModel.spaces, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentSpace = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(viewModel.currentSpace == index ? Color.white : .black)
                                            .font(.system(size: 12, weight: .medium))
                                            .padding(10)
                                            .padding(.horizontal, 3)
                                            .background(RoundedRectangle(cornerRadius: 15).fill( viewModel.currentSpace == index ? Color("prim") : Color.gray.opacity(0.4)))
                                    })
                                }
                            }
                        }
                        .frame(height: 55)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    VStack(alignment: .leading) {
                        
                        Text("Temperature")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.plTemp.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.plTemp)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                        .padding(1)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    VStack(alignment: .leading) {
                        
                        Text("The soil")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.plSoil.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.plSoil)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                        .padding(1)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    VStack(alignment: .leading) {
                        
                        Text("Sun")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {
                                
                                ForEach(viewModel.suns, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentSun = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(viewModel.currentSun == index ? Color.white : .black)
                                            .font(.system(size: 12, weight: .medium))
                                            .padding(10)
                                            .padding(.horizontal, 3)
                                            .background(RoundedRectangle(cornerRadius: 15).fill( viewModel.currentSun == index ? Color("prim") : Color.gray.opacity(0.4)))
                                    })
                                }
                            }
                        }
                        .frame(height: 55)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddView()
}
