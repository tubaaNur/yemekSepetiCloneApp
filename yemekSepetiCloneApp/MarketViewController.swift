//
//  ViewController.swift
//  yemekSepetiCloneApp
//
//  Created by Tuba Nur  on 15.08.2023.
//

import UIKit

class MarketViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
   
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    var sliderImageList = ["slider","slider","slider","slider","slider","slider"]
    
    var categoryList = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self

        
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
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // Yatay kaydırma gerekiyorsa
        sliderCollectionView.collectionViewLayout = layout

      
       
        
    }


}
extension MarketViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if(collectionView.restorationIdentifier == "category"){
            return categoryList.count
        }
        else{
            return sliderImageList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(collectionView.restorationIdentifier)
        if(collectionView.restorationIdentifier == "category"){
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuViewCell", for: indexPath) as? MenuViewCell {
                let category = categoryList[indexPath.row]
                         cell.categoryImageView.image = UIImage(named: category.image!)
                cell.categoryName.text = category.name!
                return cell
            }
            return UICollectionViewCell()
        }
        else{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SliderCollectionViewCell {
                cell.sliderImage.image = UIImage(named: sliderImageList[indexPath.row])
                return cell
            }
            return UICollectionViewCell()
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView.restorationIdentifier == "category"){
           
            // 10 X 10 X 10 = 30 BOŞLUK
            // 15X 15 X 15 x 15 = 50 BOŞLUK
            let ekranGenislik = UIScreen.main.bounds.width
            let itemGenislik = (ekranGenislik-80) / 4

            return CGSize(width: itemGenislik, height: itemGenislik * 1.6)
        }
        else{
            return CGSize(width: sliderCollectionView.frame.width, height: sliderCollectionView.frame.height)
        }
    }

    }



