//
//  KHLifeModel.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/1/25.
//

import UIKit

struct KHLifeModel: Identifiable {
    let id = UUID()
    let image: UIImage
}

extension KHLifeModel {
    static func dummy() -> [KHLifeModel] {
        return [
            KHLifeModel(image: .playground),
            KHLifeModel(image: .heyDoctor),
            KHLifeModel(image: .divorce),
            KHLifeModel(image: .nctLife)
        ]
    }
}
