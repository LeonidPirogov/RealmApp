//
//  DataManager.swift
//  RealmApp
//
//  Created by Leonid on 07.10.2025.
//

import Foundation
import RealmSwift

final class DataManager {
    static let shared = DataManager()
    
    private let storageManager = StorageManager.shared
    
    private init() {}
    
    func createTempDate(completion: @escaping () -> Void) {
        let shoppingList = TaskList()
        shoppingList.title = "Shopping List"
        
        let moviesList = TaskList(value: ["Movies List"])
        
        let milk = Task(value: ["Milk", "Buy 2 liters"])
        let apples = Task(value: ["Apples", "Buy 1 kg"])
        let bread = Task(value: ["title": "Bread", "isComplete": true])
        
        let wolfOfWallStreet = Task(value: ["The Wolf of Wall Street"])
        let forrestGump = Task(value: ["Forrest Gump", "Must have"])
        
        shoppingList.tasks.insert(contentsOf: [milk, apples, bread], at: 0)
        moviesList.tasks.insert(contentsOf: [wolfOfWallStreet, forrestGump], at: 0)
        
        DispatchQueue.main.async { [unowned self] in 
            storageManager.save([shoppingList, moviesList])
            completion()
        }
        
    }
}
