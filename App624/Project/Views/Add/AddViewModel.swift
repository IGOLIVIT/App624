//
//  AddViewModel.swift
//  App624
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI
import CoreData

final class AddViewModel: ObservableObject {

    @Published var photos: [String] = ["1", "2", "3", "4", "5"]
    @Published var currentPhoto = ""
    
    @Published var suns: [String] = ["Sunny", "Partial sun", "Shadow"]
    @Published var currentSun = ""

    @Published var isAdd: Bool = false
    @Published var isAddCat: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    
    @AppStorage("spaces") var spaces: [String] = [""]
    @Published var currentSpace: String = ""

    @Published var plPhoto = ""
    @Published var plName = ""
    @Published var plType = ""
    @Published var plSpace = ""
    @Published var plTemp = ""
    @Published var plSoil = ""
    @Published var plSun = ""

    @Published var plants: [PlantModel] = []
    @Published var selectedPlant: PlantModel?
    
    func addPlant() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PlantModel", into: context) as! PlantModel
        
        loan.plPhoto = plPhoto
        loan.plName = plName
        loan.plType = plType
        loan.plSpace = plSpace
        loan.plTemp = plTemp
        loan.plSoil = plSoil
        loan.plSun = plSun
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchPlants() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PlantModel>(entityName: "PlantModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.plants = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.plants = []
        }
    }
}
