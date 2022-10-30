//
//  ProductTableViewCell.swift
//  ShopifyChallenge2019
//
//  Created by Michael Wang on 2018-09-14.
//  Copyright © 2018 Michael Wang. All rights reserved.
//

import UIKit
import SDWebImage

// Custom table view cell for the Product View
class ProductTableViewCell: UITableViewCell
{
    // Image and label outlets for the cell
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var variantLabel: UILabel!
    @IBOutlet weak var inventoryLabel: UILabel!
    
    
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
