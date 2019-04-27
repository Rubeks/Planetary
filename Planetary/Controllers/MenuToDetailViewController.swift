//
//  MenuToDetailViewController.swift
//  Planetary
//
//  Created by Раис Аглиуллов on 27/04/2019.
//  Copyright © 2019 Раис Аглиуллов. All rights reserved.
//

import UIKit

class MenuToDetailViewController: UIViewController {
    
    //9. Объект модели
    var menuModel: MenuModel?


    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = UIColor.white
            titleLabel.backgroundColor = .clear
            titleLabel.font = UIFont(name: "DINCondensed-Bold", size: 22)
            titleLabel.textAlignment = .center
            
            titleLabel.text = menuModel?.name
        }
    }
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.roundCorners([.bottomLeft, .bottomRight], radius: 30)
            imageView.contentMode = .scaleAspectFill
            
            if let imageName = menuModel?.imageName {
                             imageView.image = UIImage(named: imageName)
                          }
        }
    }
    @IBOutlet weak var textView: UITextView!{
        didSet {
            textView.textColor = UIColor.white
            textView.backgroundColor = .clear
            textView.font = UIFont(name: "DINCondensed-Bold", size: 20)
            textView.textAlignment = .justified
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        viewSetting()
        
        print(menuModel)
    }
    
    //10. Статус бар белый
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //8. Настройка View
    private func viewSetting() {
        
        let centerColor = UIColor(red: 12 / 255, green: 35 / 255, blue: 43 / 255, alpha: 1)
        let downColor = UIColor(red: 6 / 255, green: 16 / 255, blue: 29 / 255, alpha: 1)
        
        myView.setGradientBackgroundCenterToTopOrBottom(colorOne: centerColor, colorTwo: downColor, direction: .centerToBot)
    }
    
    //11. Dismiss
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}



