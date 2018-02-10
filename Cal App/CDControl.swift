//
//  CDControl.swift
//  Cal App
//
//  Created by Basil Latif on 4/19/17.
//  Copyright © 2017 Basil Latif. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CDControl{
    var pic:[Image] = []
    var context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    init() {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Image")
        pic = ((try? context.fetch(fetch)) as? [Image])!
    }
    
    func add(picture: NSData, name: String) {
        let entity = NSEntityDescription.entity(forEntityName: "Image", in: context)
        let new = Image(entity: entity!, insertInto: context)
        new.name=name
        new.picture=picture as Data
        
        do {
            try context.save()
        } catch {
            print(Error.self)
        }
        
    }
}
