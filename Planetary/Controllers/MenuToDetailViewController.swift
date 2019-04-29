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
    
    //16.Свойство для записи словаря(будет приниматься из VC)
    var menuToDetailDictionary: NSDictionary?
    
    // Свойство для Заполнения таблицы под imageViw
    var menuToDetailModelView: MenuToDetailModelView!
    
    //17.Свойство для значений словаря
    private var arrayValues = [String]()
    
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
            textView.isUserInteractionEnabled = false
            setTextView()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadItemsInPlistFile()
        
        viewSetting()
        
        menuToDetailModelView = MenuToDetailModelView()
        
        print(menuToDetailModelView.planetaryArray)
 
        
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
    
    //21.Настройка текстВью для каждой вкладки MenuToDetail
    func setTextView() {
        
        //18. Доступ к Плисту
        let path = Bundle.main.path(forResource: "MenuToDetailPList", ofType: "plist")
        if let path = path {
            menuToDetailDictionary = (NSDictionary(contentsOfFile: path))!
        }
        
        //19. Запись значений словаря
        arrayValues = menuToDetailDictionary?.object(forKey: "SkyObject") as! [String]
        
        //20. Загрузка в текстВью.
        let nameLabel = menuModel?.name
        
        switch nameLabel {
        case "Звезды":
            textView.text = arrayValues[0]
        case "Планеты":
            textView.text = arrayValues[1]
        case "Кометы":
            textView.text = arrayValues[2]
        case "Черные дыры":
            textView.text = arrayValues[3]
        case "Квазары":
            textView.text = arrayValues[4]
        case "Магнетары":
            textView.text = arrayValues[5]
        case "Галактики":
            textView.text = arrayValues[6]
        case "Астеройды":
            textView.text = arrayValues[7]
        default:
            break
        }
    }
    
    @IBAction func testButton(_ sender: UIButton) {
        //loadItemsInPlistFile()
        
    }
    //11. Dismiss
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension MenuToDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = menuToDetailModelView.planetaryArray.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MenuDetailTableViewCell {
            
            let arrayModelView = menuToDetailModelView.planetaryArray
            
            cell.backgroundColor = UIColor(red: 78 / 255, green: 124 / 255, blue: 146 / 255, alpha: 1.0)
            cell.imageViewCustom.image = UIImage(named: arrayModelView[indexPath.row].imageName)
            cell.nameLabel.text = arrayModelView[indexPath.row].nameLabel
            cell.descriptionLabel.text = arrayModelView[indexPath.row].descriptionLabel
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}



