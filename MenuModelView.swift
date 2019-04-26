//
//  MenuModelView.swift
//  Planetary
//
//  Created by Раис Аглиуллов on 26/04/2019.
//  Copyright © 2019 Раис Аглиуллов. All rights reserved.
//

import Foundation

//6. МоделВью для заполнения
class MenuModelView {
    
    let menuObjects: [MenuModel] = {
        
        var obj1 = MenuModel(imageName: "sun", name: "Звезды")
        let obj2 = MenuModel(imageName: "earth", name: "Планеты")
        let obj3 = MenuModel(imageName: "kometa", name: "Кометы")
        let obj4 = MenuModel(imageName: "blackhole", name: "Черные дыры")
        let obj5 = MenuModel(imageName: "kvazar", name: "Квазары")
        let obj6 = MenuModel(imageName: "magnetar", name: "Магнетары")
        let obj7 = MenuModel(imageName: "galaxy", name: "Галактики")
        let obj8 = MenuModel(imageName: "asteroid", name: "Астеройды")

        return [obj1, obj2, obj3, obj4, obj5, obj6, obj7, obj8]
    }()
}
