//
//  MenuToDetailModelView.swift
//  Planetary
//
//  Created by Раис Аглиуллов on 29/04/2019.
//  Copyright © 2019 Раис Аглиуллов. All rights reserved.
//

import Foundation

class MenuToDetailModelView {
    
    let planetaryArray: [MenuToDetailModel] = {
       let obj1 = MenuToDetailModel(imageName: "neptune", nameLabel: "Газовые планеты", descriptionLabel: "Планеты, состоящие в значительной мере из водорода, гелия, аммиака, метана и других газов.")
        let obj2 = MenuToDetailModel(imageName: "marsTwo", nameLabel: "Планеты земного типа", descriptionLabel: "Планеты земной группы обладают высокой плотностью и состоят преимущественно из силикатов и металлического железа.")
        let obj3 = MenuToDetailModel(imageName: "pluto", nameLabel: "Карликовые планеты", descriptionLabel: "Планеты, на орбите звезды, которое достаточно массивно, чтобы округляться за счет собственной гравитации, но не очищать ближайший регион от планетезималей, и не является спутником.")

        return [obj1, obj2, obj3]

    }()
    
    
}
