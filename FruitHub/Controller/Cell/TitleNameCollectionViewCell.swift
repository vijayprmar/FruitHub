//
//  TitleNameCollectionViewCell.swift
//  FruitHub
//
//  Created by Vijay Parmar on 28/08/23.
//

import UIKit

class TitleNameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewUnderline: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    func configure(selectedIndex:Int,currentIndex:Int,title:String){
        if selectedIndex == currentIndex{
            lblTitle.font = UIFont.BrandonGrotesqueMedium(withSize:20)
            lblTitle.textColor = UIColor.colorBold
            lblTitle.text = title
            viewUnderline.isHidden = false
        }else{
            lblTitle.font = UIFont.BrandonGrotesqueMedium(withSize:20)
            lblTitle.textColor = UIColor.colorTitle
            lblTitle.text = title
            viewUnderline.isHidden = true
        }
    }
    
}
