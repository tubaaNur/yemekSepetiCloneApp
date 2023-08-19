//
//  Category.swift
//  yemekSepetiCloneApp
//
//  Created by Tuba Nur  on 16.08.2023.
//

import Foundation

class Category{
    
    var name:String?
    var image:String?
   
    init(){}
    
    init(name: String? = nil, image: String? = nil) {
        self.name = name
        self.image = image
    }
}
