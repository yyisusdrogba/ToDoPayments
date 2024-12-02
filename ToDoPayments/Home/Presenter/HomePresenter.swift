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
            for pagos in payments {
                print(pagos.name)
            }
        })
    }
}
