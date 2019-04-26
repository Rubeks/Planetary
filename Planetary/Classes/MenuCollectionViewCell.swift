//
//  MenuCollectionViewCell.swift
//  Planetary
//
//  Created by Раис Аглиуллов on 26/04/2019.
//  Copyright © 2019 Раис Аглиуллов. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    //4. Настройка ячейки
    @IBOutlet weak var imageView: UIImageView!{
        didSet {
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 15
            imageView.layer.borderWidth = 2
            let borderColor = UIColor(red: 98 / 255, green: 121 / 255, blue: 129 / 255, alpha: 1).cgColor
            imageView.layer.borderColor = borderColor
            imageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var menuLabel: UILabel! {
        didSet {
            menuLabel.textColor = .white
        }
    }
}
