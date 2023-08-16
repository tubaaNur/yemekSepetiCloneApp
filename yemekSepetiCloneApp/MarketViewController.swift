//
//  ViewController.swift
//  yemekSepetiCloneApp
//
//  Created by Tuba Nur  on 15.08.2023.
//

import UIKit

class MarketViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    var categoryList = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        let m1 = Category( name: "Yeni Ürünler", image: "bread")
        let m2 = Category(name: "Fırından", image:  "bread")
        let m3 = Category( name: "Su", image:  "bread")
        let m4 = Category(name: "Süt ve Kahvaltılık", image:  "bread")
        let m5 = Category(name: "Meyve § Sebze", image:  "bread")
        let m6 = Category(name: "İçecek", image:  "bread")
        
        categoryList.append(m1)
        categoryList.append(m2)
        categoryList.append(m3)
        categoryList.append(m4)
        categoryList.append(m5)
        categoryList.append(m6)
       
    }


}
extension MarketViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuViewCell {
            let category = categoryList[indexPath.row]
                cell.categoryImageView.image = UIImage(named: category.image!)
                cell.categoryName.text = category.name!
               return cell
        }
        return UICollectionViewCell()
    }
    
}


