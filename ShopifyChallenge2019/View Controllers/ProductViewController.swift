//
//  ProductViewController.swift
//  ShopifyChallenge2019
//
//  Created by Michael Wang on 2018-09-14.
//  Copyright © 2018 Michael Wang. All rights reserved.
//

import UIKit

// SDWebImage library is used to display image URLs from the web
import SDWebImage


// View controller for the product view
class ProductViewController: UIViewController
{
    // The name of the tag being displayed
    var tagName = ""
    
    // Array of all products (passed from the tag view controller)
    var products = [Product]()
    
    // Array of all products with the specified tag
    var taggedProducts = [Product]()
    
    
    // Actions performed when the view first loads
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Iterate through the products array to find ones containing the specified tag
        for product in products
        {
            // If a product contains the tag,
            if product.tags.contains(tagName)
            {
                // Add the product to the products array
                taggedProducts.append(product)
            }
        }
        
        
        // Set the navigation bar title to the tag, and the number of tagged products
        self.title = "\(tagName) (\(taggedProducts.count))"

    }
}
    



extension ProductViewController: UITableViewDataSource, UITableViewDelegate
{

    // Set the number of table view cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // The number of cells is equal to the length of the taged products array
        return taggedProducts.count
    }
    
    // Set the appearance of each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Create a cell of type ProductTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        
        // Set the text of the tag label
        cell.productLabel.text = taggedProducts[indexPath.row].title
        
        // Set the text of the variant label
        cell.variantLabel.text = taggedProducts[indexPath.row].variant
        
        // Set the text of the inventory label
        cell.inventoryLabel.text = "Inventory: \(taggedProducts[indexPath.row].inventory)"
        
        // Convert the imageUrl string to an URL object
        let imageUrl = URL(string: taggedProducts[indexPath.row].imageUrl)
        
        // Set the product image view to the URL using the SDWebImage library
        cell.productImage.sd_setImage(with: imageUrl)
        
        return cell
    }

}
