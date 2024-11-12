//
//  HomeDataManager.swift
//  ToDoPayments
//
//  Created by Jesus Gonzalez on 07/11/24.
//

import Foundation
import UIKit

class HomeDataManager {
    func getActionsForButton () -> [UIAction]{
        return [
            UIAction(title: "Entertainment", image: UIImage(systemName: "arcade.stick.console")) { action in
                print("actionOne:\(action)")
            },
            UIAction(title: "Feeding", image: UIImage(systemName: "fork.knife")) { action in
                print("actionOne:\(action)")
            },
            UIAction(title: "Transport", image: UIImage(systemName: "car")) { action in
                print("actionOne:\(action)")
            },
            UIAction(title: "Dwelling", image: UIImage(systemName: "house")) { action in
                print("actionOne:\(action)")
            },
            UIAction(title: "Health and wellness", image: UIImage(systemName: "heart")) { action in
                print("actionOne:\(action)")
            },
            UIAction(title: "Education and personal development", image: UIImage(systemName: "graduationcap")) { action in
                print("actionOne:\(action)")
            },
            UIAction(title: "Technology and communication", image: UIImage(systemName: "desktopcomputer")) { action in
                print("actionOne:\(action)")
            },
            UIAction(title: "Clothing and accessories", image: UIImage(systemName: "cart")) { action in
                print("actionOne:\(action)")
            },
            UIAction(title: "Finance and Insurance", image: UIImage(systemName: "dollarsign.bank.building.fill")) { action in
                print("actionOne:\(action)")
            },
        ]
    }
}
