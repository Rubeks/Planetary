//
//  MenuDetailTableViewCell.swift
//  Planetary
//
//  Created by Раис Аглиуллов on 29/04/2019.
//  Copyright © 2019 Раис Аглиуллов. All rights reserved.
//

import UIKit

class MenuDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewCustom: UIImageView!{
        didSet {
            imageViewCustom.contentMode = .scaleAspectFill
            imageViewCustom.layer.cornerRadius = imageViewCustom.frame.height / 2
            imageViewCustom.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.textColor = .white
            nameLabel.textAlignment = .justified
            nameLabel.font = UIFont(name: "DINCondensed-Bold", size: 20)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.textColor = .white
            descriptionLabel.textAlignment = .justified
            descriptionLabel.font = UIFont(name: "DINCondensed-Bold", size: 17)
            descriptionLabel.numberOfLines = 0
        }
    }
}
