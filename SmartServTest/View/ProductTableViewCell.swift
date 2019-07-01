//
//  ProductTableViewCell.swift
//  SmartServTest
//
//  Created by Kondya on 01/07/19.
//  Copyright © 2019 Fortune4. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    
    @IBOutlet weak var productTitleLbl: UILabel!
    
    @IBOutlet weak var productSubcategoryLbl: UILabel!
    
    @IBOutlet weak var productPriceLbl: UILabel!
    
    @IBOutlet weak var productPopularityLbl: UILabel!
    
    func setModel(model:ProductModel)  {
       
        self.productTitleLbl.attributedText = (model.title).decorateText(sub: "Title: ")
        self.productPriceLbl.attributedText = (model.price).decorateText(sub: "Price: ")
        self.productSubcategoryLbl.attributedText = (self.bindSubCategoryText(subcategory: model.subcategory)).decorateText(sub: "Subcategory: ")
        self.productPopularityLbl.attributedText = (model.popularity).decorateText(sub: "Popularity: ")
    }
    func bindSubCategoryText(subcategory:Subcategory) -> String {
        switch subcategory {
        case .fitnessTracker :
            return "Fitness Tracker"
           
        case .mobile:
            return "Mobile"
            
        case .smartWatches :
            return "Smart Watches"
            
        case .tablet :
            return "Tablet"
           
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
