//
//  CategoryCell.swift
//  yemekSepetiCloneApp
//
//  Created by Tuba Nur  on 16.08.2023.
//

import UIKit

class MenuViewCell: UICollectionViewCell {
   
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    //    @IBOutlet weak var categoryName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
//        configureStyle()
    }
    
    private func configureStyle() {
//        categoryImageView.backgroundColor = .white
//        categoryImageView.layer.cornerRadius = 14
//
//        let shadowLayer = CALayer()
//
//        shadowLayer.frame = categoryImageView.frame
//        shadowLayer.cornerRadius = categoryImageView.layer.cornerRadius
//        shadowLayer.backgroundColor = UIColor.white.cgColor
//        shadowLayer.shadowColor = UIColor.black.cgColor
//        shadowLayer.shadowOpacity = 0.2
//        shadowLayer.shadowRadius = 4
//        shadowLayer.shadowOffset = CGSize(width: 0, height: 4)
//
//        categoryImageView.superview?.layer.insertSublayer(shadowLayer, below: categoryImageView.layer)
    }
}
