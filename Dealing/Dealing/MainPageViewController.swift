//
//  MainPageViewController.swift
//  Dealing
//
//  Created by 이정우 on 2022/01/06.
//

import UIKit

class MainPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var imageSliderCollectionView : UICollectionView!
    
    var timer : Timer?
    var currentCellIndex = 0
    var photosArr = [UIImage(named: "sliderimage1"),UIImage(named: "sliderimage2"),UIImage(named: "sliderimage3"),UIImage(named: "sliderimage4"),UIImage(named: "sliderimage5"),UIImage(named: "sliderimage6")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSliderCollectionView.delegate = self
        imageSliderCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func startTimer(){
            timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
        }
    
    @objc func moveToNextIndex(){
            currentCellIndex += 1
            imageSliderCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
            
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageSliderCollectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as! ImageSliderCollectionViewCell
        cell.imageView.image = photosArr[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }

}
