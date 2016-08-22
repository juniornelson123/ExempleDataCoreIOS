//
//  Product.swift
//  FoodExemple
//
//  Created by junior on 20/08/16.
//  Copyright © 2016 junior. All rights reserved.
//

import UIKit

class Product {
    
    var name:String
    var photo:UIImage?
    var rating:Int
    
    init?(name:String,photo:UIImage?,rating:Int){
        self.name = name
        self.rating = rating
        self.photo = photo

        if name.isEmpty || rating < 0{
            return nil
        }

    }
    
    
}
