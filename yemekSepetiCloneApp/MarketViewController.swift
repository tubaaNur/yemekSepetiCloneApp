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
        
        let m1 = Category( name: "Yeni Ürünler", image: "ring")
        let m2 = Category(name: "Fırından", image:  "bread")
        let m3 = Category( name: "Su", image:  "water")
        let m4 = Category(name: "Sağlıklı Yaşam", image:  "fit")
        let m5 = Category(name: "Meyve & Sebze", image:  "vegetable")
        let m6 = Category(name: "İçecek", image:  "drinks")
        let m7 = Category(name: "Atıştırmalık", image:  "snack")
        let m8 = Category(name: "Dondurma", image:  "ice cream")
        let m9 = Category(name: "Hazır ve Donuk Gıda", image:  "prepared foods")
        let m10 = Category(name: "Taze Yemek", image:  "fresh food")
        let m11 = Category(name: "Kahve", image:  "coffee")
        let m12 = Category(name: "Temel Gıda", image:  "staple fod")
        let m13 = Category(name: "Sağlıklı Yaşam", image:  "fit")
        let m14 = Category(name: "Kişisel Bakım", image:  "personal care")
        let m15 = Category(name: "Ev Bakım", image:  "clean")
        let m16 = Category(name: "Evcil Hayvan", image:  "animals")
        
        
        categoryList.append(m1)
        categoryList.append(m2)
        categoryList.append(m3)
        categoryList.append(m4)
        categoryList.append(m5)
        categoryList.append(m6)
        categoryList.append(m7)
        categoryList.append(m8)
        categoryList.append(m9)
        categoryList.append(m10)
        categoryList.append(m11)
        categoryList.append(m12)
        categoryList.append(m13)
        categoryList.append(m14)
        categoryList.append(m15)
        categoryList.append(m16)
      
       
        let tasarım = UICollectionViewFlowLayout()
        tasarım.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarım.minimumInteritemSpacing = 10
        tasarım.minimumLineSpacing = 10
        
        // 10 X 10 X 10 = 30 BOŞLUK
        // 15X 15 X 15 x 15 = 50 BOŞLUK
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik-80) / 4
        
        tasarım.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.6)
        categoryCollectionView.collectionViewLayout = tasarım
        
    }


}
extension MarketViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuViewCell", for: indexPath) as? MenuViewCell {
            let category = categoryList[indexPath.row]
                cell.categoryImageView.image = UIImage(named: category.image!)
                cell.categoryName.text = category.name!
               return cell
        }
        return UICollectionViewCell()
    }
    
}


