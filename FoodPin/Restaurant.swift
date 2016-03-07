//
//  Restaurant.swift
//  FoodPin
//
//  Created by Dharahas Tallapally on 20/10/15.
//  Copyright © 2015 Dharahas Tallapally. All rights reserved.
//

import Foundation
import CoreData


class Restaurant: NSManagedObject {
    
    @NSManaged var name: String!
    @NSManaged var type: String!
    @NSManaged var location: String!
    @NSManaged var image: NSData!
    @NSManaged var isVisited: NSNumber!
    
    
    
    
}