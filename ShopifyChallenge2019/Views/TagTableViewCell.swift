//
//  TagTableViewCell.swift
//  ShopifyChallenge2019
//
//  Created by Michael Wang on 2018-09-14.
//  Copyright © 2018 Michael Wang. All rights reserved.
//

import UIKit


// Protocol for performing segues
protocol TagTableViewCellDelegate
{
    // This function takes a tag and performs a segue to the product view
    func goToProductVC(tagName: String)
}


// Custom table view cell for the tag view
class TagTableViewCell: UITableViewCell
{
    // Tag name label for the cell
    @IBOutlet weak var tagLabel: UILabel!
 
    //TagTableViewCellDelegate delegate is used for switching views
    var delegate: TagTableViewCellDelegate?
    
    
    // Actions performed when the cell is tapped
    @objc func cell_TouchUpInside()
    {
        // Perform a segue to the product view
        delegate?.goToProductVC(tagName: tagLabel.text!)
    }
    
    
    // This function is called in TagViewController to perform the segue
    func updateView()
    {
        // Create a tap gesture recognizer
        let tapGestured = UITapGestureRecognizer(target: self, action: #selector(self.cell_TouchUpInside))
    
        // Add the tap gesture recognizer to the cell
        addGestureRecognizer(tapGestured)
        
        // Enable user interaction for the cell
        isUserInteractionEnabled = true
    }
    
    
    // Actions performed when the cell loads
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    // Set the state of the cell
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
