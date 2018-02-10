//
//  Image.swift
//  Cal App
//
//  Created by Basil Latif on 4/13/17.
//  Copyright © 2017 Basil Latif. All rights reserved.
//

import Foundation
import CoreData

class Image: NSManagedObject
{
    @NSManaged var picture: Data
    @NSManaged var name: String
}
