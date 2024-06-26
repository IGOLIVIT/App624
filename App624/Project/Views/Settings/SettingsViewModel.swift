//
//  SettingsViewModel.swift
//  App624
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI
import CoreData

final class SettingsViewModel: ObservableObject {

    @AppStorage("spaces") var spaces: [String] = [""]
    @Published var isReset: Bool = false

}

