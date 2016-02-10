//
//  Highscores+CoreDataProperties.swift
//  Times Play
//
//  Created by Gregory DeNinno on 2/9/16.
//  Copyright © 2016 SCDE. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Highscores {

    @NSManaged var player: String?
    @NSManaged var score: String?

}
