//
//  CardPresenter.swift
//  ToDoPayments
//
//  Created by Jesus Gonzalez on 19/11/24.
//

import Foundation
import UIKit

class CardPresenter {
    
    let coreDataPayment: CoreDataPayment = CoreDataPayment()

    func operationOfPaymentDivided(price: String, numberOfPersons: String) -> String {
        
        guard let price = Float(price), let numberOfPersons = Float(numberOfPersons) else { return "0" }
        let operation = (price / numberOfPersons)
        return String(format: "%.2f", (operation))
        
    }
    
    func obtainPayment(model: ModelPaymentCard) {
        coreDataPayment.createCard(model: model)
    }
}

