//
//  SpacesViewModel.swift
//  App624
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI
import CoreData

final class SpacesViewModel: ObservableObject {

    @Published var isAddSpace: Bool = false
    @Published var isAddPlant: Bool = false
    
    @AppStorage("spaces") var spaces: [String] = []
    @Published var addSpace: String = ""

}
