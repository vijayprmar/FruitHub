//
//  FruitListingCollectionviewCell.swift
//  FruitHub
//
//  Created by Vijay Parmar on 28/08/23.
//

import UIKit

class FruitListingCollectionviewCell: UICollectionViewCell {

    @IBOutlet weak var viewContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

     func configure(){
        viewContainer.backgroundColor = UIColor.random.withAlphaComponent(0.1)
    }
    
    
}
