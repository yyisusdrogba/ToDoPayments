//
//  CardPresenter.swift
//  ToDoPayments
//
//  Created by Jesus Gonzalez on 19/11/24.
//

import Foundation
import UIKit

protocol CardPresenterProtocol {
    func operationOfPaymentDivided(price: String, numberOfPersons: String) -> String
    func createPayment(model: ModelPaymentCard)
}


class CardPresenter: CardPresenterProtocol{
    
    var coreDataPayment: CoreDataPayment?
    var cardViewProtocol: CardViewProtocol?
    
    
    init(coreDataPayment: CoreDataPayment? = CoreDataPayment(), cardViewProtocol: CardViewProtocol?) {
        self.coreDataPayment = coreDataPayment
        self.cardViewProtocol = cardViewProtocol
    }
    
    func operationOfPaymentDivided(price: String, numberOfPersons: String) -> String {
        
        guard let price = Float(price), let numberOfPersons = Float(numberOfPersons) else { return "0" }
        let operation = (price / numberOfPersons)
        return String(format: "%.2f", (operation))
        
    }
    
    func createPayment(model: ModelPaymentCard) {
        coreDataPayment?.createCard(model: model, completionHandler: { state in
            switch state {
            case true:
                self.cardViewProtocol?.succes()
            default:
                self.cardViewProtocol?.error()
            }
        })
    }
    
}

