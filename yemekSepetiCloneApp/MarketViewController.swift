//
//  ViewController.swift
//  yemekSepetiCloneApp
//
//  Created by Tuba Nur  on 15.08.2023.
//

import UIKit

class MarketViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    var sliderImageList = ["slider","slider2","slider","slider2","slider","slider2"]
    
    var categoryList = [ Category( name: "Yeni Ürünler", image: "ring"),
                         Category(name: "Fırından", image:  "bread"),
                         Category( name: "Su", image:  "water"),
                         Category(name: "Sağlıklı Yaşam", image:  "fit"),
                         Category(name: "Meyve & Sebze", image:  "vegetable"),
                         Category(name: "İçecek", image:  "drinks"),
                         Category(name: "Atıştırmalık", image:  "snack"),
                         Category(name: "Dondurma", image:  "ice cream"),
                         Category(name: "Hazır ve Donuk Gıda", image:  "prepared foods"),
                         Category(name: "Taze Yemek", image:  "fresh food"),
                         Category(name: "Kahve", image:  "coffee"),
                         Category(name: "Temel Gıda", image:  "staple fod"),
                         Category(name: "Sağlıklı Yaşam", image:  "fit"),
                         Category(name: "Kişisel Bakım", image:  "personal care"),
                         Category(name: "Ev Bakım", image:  "clean"),
                         Category(name: "Evcil Hayvan", image:  "animals")
    ]
    
    var currentCellIndex = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.setSearchFieldBackgroundImage(UIImage(), for: .normal)
        searchBar.searchBarStyle = .minimal
        searchBar.layer.cornerRadius = 10
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext),userInfo: nil,repeats: true)
        pageControl.numberOfPages = sliderImageList.count
    }
    
    @objc func slideToNext()
    {
        if currentCellIndex < sliderImageList.count-1
        {
            currentCellIndex = currentCellIndex+1
        }
        else{
            currentCellIndex = 0
        }
        pageControl.currentPage = currentCellIndex
        sliderCollectionView.isPagingEnabled = false
        self.sliderCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
        sliderCollectionView.isPagingEnabled = true
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
        
        if(collectionView.restorationIdentifier == "category"){
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuViewCell", for: indexPath) as? MenuViewCell {
                let category = categoryList[indexPath.row]
                cell.categoryImageView.image = UIImage(named: category.image!)
                cell.categoryImageView.backgroundColor = .white
                cell.categoryImageView.layer.cornerRadius = 14
                cell.categoryName.text = category.name!
                return cell
            }
            return UICollectionViewCell()
        }
        else{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SliderCollectionViewCell {
                cell.sliderImage.image = UIImage(named: sliderImageList[indexPath.row])
                cell.sliderImage.layer.cornerRadius = 10
                return cell
            }
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView.restorationIdentifier == "category"){
            let screenWidth = UIScreen.main.bounds.width
            let itemWidth = (screenWidth-100) / 4

            return CGSize(width: itemWidth * 1.1, height: itemWidth * 1.6)
        }
        else{
            return CGSize(width: sliderCollectionView.frame.width, height: sliderCollectionView.frame.height)
        }
    }
}


