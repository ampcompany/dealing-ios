//
//  ProductCollectionViewCell.swift
//  Dealing
//
//  Created by 이정우 on 2022/02/02.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView : UIImageView!
    @IBOutlet weak var timerImageView : UIImageView!
    @IBOutlet weak var userImageView : UIImageView!
    @IBOutlet weak var likeImageVIew : UIImageView!
    
    @IBOutlet weak var timerLabel : UILabel!
    @IBOutlet weak var productLabel : UILabel!
    @IBOutlet weak var priceLabel : UILabel!
    @IBOutlet weak var userLabel : UILabel!
    @IBOutlet weak var likeLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
