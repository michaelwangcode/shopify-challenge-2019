//
//  Product.swift
//  ShopifyChallenge2019
//
//  Created by Michael Wang on 2018-09-14.
//  Copyright © 2018 Michael Wang. All rights reserved.
//

import Foundation

// This struct represents a Product object
struct Product
{
    // Product properties
    let title: String
    let variant: String
    let tags: [String]
    let inventory: Int
    let imageUrl: String
    
    // Product initializer
    init(title: String, variant: String, tags: [String], inventory: Int, imageUrl: String)
    {
        self.title = title
        self.variant = variant
        self.tags = tags
        self.inventory = inventory
        self.imageUrl = imageUrl
    }
}
