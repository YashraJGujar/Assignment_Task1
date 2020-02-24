//
//  collectionViewCell.swift
//  Assignment_Task1
//
//  Created by YashraJ Gujar on 24/02/20.
//  Copyright © 2020 YashraJ. All rights reserved.
//

import UIKit

class collectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageViewRef: UIImageView!
    override func awakeFromNib() {
        imageViewRef.layer.cornerRadius = imageViewRef.frame.size.width/2
        imageViewRef.clipsToBounds = true
        super.awakeFromNib()
        // Initialization code
    }

}
