//
//  Car.swift
//  GregsonRaevan_CE5
//
//  Created by Raevan Gregson on 12/5/16.
//  Copyright © 2016 Raevan Gregson. All rights reserved.
//

import Foundation
import UIKit

class Car{
    
    var brand: String?
    var name:String?
    var make:Make
    var image:UIImage?
    
    // this is where I create a class, or blueprint for the car objects. Three stored properties and one enum computed property. Making the type a computed property with enum makes it easy to searching by (scope).
    
    init(brand: String, name: String, make:Make, image: UIImage){
        self.brand = brand
        self.name = name
        self.make = make
        self.image = image
    }
    
    enum Make: String {
        case Electric
        case Gas
        case Deisel
        case All
    }
}
