//
//  MainPageViewController.swift
//  Dealing
//
//  Created by 이정우 on 2022/01/06.
//

import UIKit
import SideMenu

class MainPageViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var imageSliderCollectionView : UICollectionView!
    @IBOutlet weak var productCollectionView : UICollectionView!
    
    var timer : Timer?
    var currentCellIndex = 0
    var photosArr = [
        UIImage(named: "sliderimage1"),
        UIImage(named: "sliderimage2"),
        UIImage(named: "sliderimage3"),
        UIImage(named: "sliderimage4")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSliderCollectionView.delegate = self
        imageSliderCollectionView.dataSource = self
//        imageSliderCollectionView.register(ImageSliderCollectionViewCell.self, forCellWithReuseIdentifier: "sliderCell")
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "productCell")
        
        imageSliderCollectionView.tag = 1
        productCollectionView.tag = 2
        
        startTimer()
        // Do any additional setup after loading the view.
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
        }
    
    @objc func moveToNextIndex(){
        currentCellIndex += 1
        if currentCellIndex == photosArr.count{
            currentCellIndex = 0
            imageSliderCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .left, animated: true
            )
        } else {
            let cellSize = CGSize(width: imageSliderCollectionView.frame.width, height: imageSliderCollectionView.frame.height);
            let contentOffset = imageSliderCollectionView.contentOffset;
            imageSliderCollectionView.scrollRectToVisible(CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true);
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1{
            return photosArr.count
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1{
            guard let sliderCell = imageSliderCollectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as? ImageSliderCollectionViewCell else{
                return UICollectionViewCell()
            }
            
            if let imageview = sliderCell.imageView{
                imageview.image = photosArr[indexPath.row]
            }
            
            return sliderCell
        }else{
            guard let productCell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCollectionViewCell else{
                return UICollectionViewCell()
            }
            
            return productCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: imageSliderCollectionView.frame.width, height: imageSliderCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    

}
