//
//  ViewController.swift
//  Planetary
//
//  Created by Раис Аглиуллов on 26/04/2019.
//  Copyright © 2019 Раис Аглиуллов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var myView: UIView!
    
    var menuModelView: MenuModelView?
    
    var menuModel: MenuModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //3. Вызов настроек
        navigationBarSetting()
        viewSetting()
        
        menuModelView = MenuModelView()
        
    }
    
    //1. Настройка навигейшен бара
    private func navigationBarSetting() {
        let upColorNbar = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        let downColorNBar = UIColor(red: 24 / 255, green: 50 / 255, blue: 68 / 255, alpha: 1)
        let colors: [UIColor] = [upColorNbar, downColorNBar]
        navigationController?.navigationBar.setGradientBackground(colors: colors)
    }
    
    //2. Настройка View
    private func viewSetting() {
        
        let centerColor = UIColor(red: 12 / 255, green: 35 / 255, blue: 43 / 255, alpha: 1)
        let downColor = UIColor(red: 6 / 255, green: 16 / 255, blue: 29 / 255, alpha: 1)
        
        myView.setGradientBackgroundCenterToTopOrBottom(colorOne: centerColor, colorTwo: downColor, direction: .centerToBot)
    }
    
    //15. Передача состояния на MenuToDetailVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "menuToDetail" {
            if let vc = segue.destination as? MenuToDetailViewController {
                vc.menuModel = menuModel
            }
        }
    }
}




//MARK: - Collection VieW
//MARK: DataSourse
extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let countArray = menuModelView?.menuObjects.count {
            return countArray
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //7. Работа с заполнением ячеки
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MenuCollectionViewCell {
            
            guard let imageName = menuModelView?.menuObjects[indexPath.row].imageName else { return UICollectionViewCell()}
            let nameLaabel = menuModelView?.menuObjects[indexPath.row].name
            
            cell.imageView.image = UIImage(named: imageName)
            cell.menuLabel.text = nameLaabel
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}

//MARK: Delegate
extension ViewController : UICollectionViewDelegate {
    
    //11. Подготовка перехода
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //12. Нажатая ячейка
        let menuToDetail = menuModelView?.menuObjects[indexPath.row]
        
        //13. Передача из modelView выбранного элемента в экземпляр структуры
        menuModel = menuToDetail
        
        //14. Переход
        performSegue(withIdentifier: "menuToDetail", sender: menuToDetail)
    }
}
