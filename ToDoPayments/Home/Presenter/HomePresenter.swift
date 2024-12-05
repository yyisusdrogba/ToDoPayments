//
//  HomePresenter.swift
//  ToDoPayments
//
//  Created by Jesus Gonzalez on 27/11/24.
//

import Foundation

protocol HomePresenterProtocol {
    func getPayments()
    var payments: [Payment] {get}
    func deletePayment(number: Int)
}

class HomePresenter: HomePresenterProtocol{
    let coreDataPayment: CoreDataPayment?
    var payments: [Payment] = []
    var view: HomeViewProtocol?
    
    init(coreDataPayment: CoreDataPayment? = CoreDataPayment(), view: HomeViewProtocol?) {
        self.coreDataPayment = coreDataPayment
        self.view = view
    }
    
    func getPayments() {
        coreDataPayment?.getAllCards(completionHandler: { payments in
            self.payments = payments
            self.view?.paymentsCharged()
        })
    }
    
    func deletePayment(number: Int){
        let card = payments[number]
        coreDataPayment?.deleteCard(card: card, completionHandler: { status in
            switch status {
            case true:
                self.view?.paymentEliminated()
                print("the payment is deleted")
            default:
                print("Error deleting payment")
            }
        })
    }
    
}
