//
//  TodoViewModel.swift
//  Todo
//
//  Created by Adeel-IOS on 29/07/2021.
//

import Foundation
import SwiftUI
import RealmSwift

class Item: Object, ObjectKeyIdentifiable {
    @objc dynamic var taskTitle: String = ""
    @objc dynamic var id: String = ""
}

class TodoViewModel: ObservableObject {
    
    @Published var freezedItems: Results<Item>!
    private var items: Results<Item>!
    private  var realm = try! Realm()
    
    
     init() {
        self.fetch()
     }

     
    
    func fetch(){
        self.items = realm.objects(Item.self)
        self.freezedItems = self.items.freeze()
       
    }
    
    func delete(deleteObject index: IndexSet) {
        try? realm.write({
            realm.delete(items.objects(at: index))
        })
        
        self.fetch()
    }
    
   
    
    func update(updateWith object : Item) {
        try? realm.write({
            
        })
    }
    
    func save(text: String){
        let item = Item()
        item.taskTitle = text
        item.id = UUID().uuidString
        try? realm.write({
            realm.add(item)
        })
        self.freezedItems = items.freeze()
    }
    
}

//
//let frozenDog = self.myDog.freeze()
//// ---> pass frozenDog to other viewController
//
//let thawedDog = frozenDog.thaw()
//try! realm.write {
//    thawedDog.age = 102
//}
//
//// If the write succeeded, self.myDog in the first viewController
//// should see its age updated to 102.
