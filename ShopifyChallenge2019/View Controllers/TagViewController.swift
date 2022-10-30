//
//  ViewController.swift
//  ShopifyChallenge2019
//
//  Created by Michael Wang on 2018-09-13.
//  Copyright © 2018 Michael Wang. All rights reserved.
//

import UIKit

// Alamofire library is used to retrieve JSON data from the web
import Alamofire


// View controller for the tag view
class TagViewController: UIViewController
{
    // The tag table view
    @IBOutlet weak var tableView: UITableView!
    
    // Stores the products in an array
    var productsArray = [AnyObject]()
    
    // Stores the products as Product objects in an array
    var productsObjectArray = [Product]()
    
    // Stores all of the unique tags in an array
    var tagsArray = [String]()
    

    // Actions performed when the view first loads
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        //----- Note: The original URL containing JSON does not work anymore -----//
        //----- Instead, we have saved the JSON in the Products.json file --------//

        // Get the product data from the Products.json
        guard let localUrl = Bundle.main.url(forResource: "Products", withExtension: "json") else { return }
        
        
        // Store the URL for the product data (no longer working)
        // let dataUrl = "https://shopicruit.myshopify.com/admin/products.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
        
        
        // Retrieve product data from the URL using Alamofire
        Alamofire.request(localUrl, method: .get).responseJSON { (response) in
            
            // Extract the JSON result
            let result = response.result.value
            
            // Store the result as a dictionary of type String: AnyObject
            if let dict = result as? [String: AnyObject]
            {
                // Retrieve the inner dictionary of products
                if let innerDict = dict["products"]
                {
                    // Store this inner dictionary in the products array
                    self.productsArray = innerDict as! [AnyObject]
                }
            }
            
            // Print the entire products array (used for debugging)
            // print(self.productsArray)
            
            // Iterate through the array of products
            // For each product in the product array,
            for item in self.productsArray
            {
                // Store the product title as a string
                let productTitle = item["title"]!! as! String
                
                // Store all of the tags as a single string
                let productTags = item["tags"]!! as! String
                
                // Store the image details as an array of dictionaries
                let image = item["image"]!! as! [String: Any]
                
                // Store the product variants as an array of dictionaries
                let variants = item["variants"]!! as! [[String: Any]]
                

                //----- TAGS -----//

                // Convert the product tags into an array of strings
                var productTagsArray = productTags.split(separator: ",").map(String.init)
                
                // Remove the excess whitespace in the product tags
                productTagsArray[1] = productTagsArray[1].trimmingCharacters(in: .whitespacesAndNewlines)
                productTagsArray[2] = productTagsArray[2].trimmingCharacters(in: .whitespacesAndNewlines)
                
                // Iterate through the tags for the current product
                for tag in productTagsArray
                {
                    // If the product tag is not already in the tags array
                    if !self.tagsArray.contains(tag)
                    {
                        // Add the tag to the array
                        self.tagsArray.append(tag)
                    }
                }
                
                // Sort the array of tags in alphabetical order
                self.tagsArray.sort()

                
                //---- IMAGES -----//
                
                // Store the product's image URL
                let imageUrl = image["src"]! as! String
                
                
                //----- VARIANTS -----//
                
                // Iterate through each of the variants,
                for variant in variants
                {
                    // Store the quantity of each product's variant as an integer
                    let inventoryQuantity = variant["inventory_quantity"] as! Int
                    
                    // Store the variant of product
                    let variantTitle = variant["title"] as! String
                    
                    // Initialize a Product object
                    let product = Product(title: productTitle, variant: variantTitle, tags: productTagsArray, inventory: inventoryQuantity, imageUrl: imageUrl)
                    
                    // Append the product object to the product array
                    self.productsObjectArray.append(product)
                }
            }
            
            // Print the array of product objects (used for debugging)
            // print(self.productsObjectArray)

            // Reload the data in the table view
            self.tableView.reloadData()
        }
    }
}
    

// Adopt the UITableViewDataSource and UITableViewDelegate protocols for formatting cells
extension TagViewController: UITableViewDataSource, UITableViewDelegate
{
    
    // Set the number of table view cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // The number of cells is equal to the length of the tags array
        return tagsArray.count
    }
    
    // Set the appearance of each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Create a cell of type TagTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TagTableViewCell", for: indexPath) as! TagTableViewCell
        
        // Set the text of the tag label
        cell.tagLabel.text = tagsArray[indexPath.row]
        
        // Call the cell's updateView function
        cell.updateView()
        
        // Set the cell delegate to self to perform the segue
        cell.delegate = self
        
        return cell
    }
    
    // Prepare for a segue to the product view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // If the segue being performed is the product segue,
        if segue.identifier == "productSegue"
        {
            // Store the destination as productVC
            let productVC = segue.destination as! ProductViewController
            
            // Store the sender parameter as a string called tagName
            let tagName = sender as! String
            
            // Assign the tagName property of the detail view controller
            productVC.tagName = tagName
            
            // Set the productsArray property of the detail view controller
            productVC.products = productsObjectArray
        }
    }
}


// Adopt the TagTableViewCellDelegate protocol for performing segues
extension TagViewController: TagTableViewCellDelegate
{
    // This method switches views to the product view of a given tag
    func goToProductVC(tagName: String)
    {
        // Perform a segue to the post Detail view
        performSegue(withIdentifier: "productSegue", sender: tagName)
    }
}

