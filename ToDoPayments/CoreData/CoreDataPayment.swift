//
//  CoreDataPayment.swift
//  ToDoPayments
//
//  Created by Jesus Gonzalez on 25/11/24.
//

import Foundation
import UIKit

class CoreDataPayment {
    
    let context = CoreDataManager.shared.viewContext
    
    func getAllCards(completionHandler: @escaping ([Payment]) -> Void) {
        do {
            completionHandler(try context.fetch(Payment.fetchRequest()))
        } catch {
            //error
            completionHandler([])
        }
    }
    
    func createCard(model: ModelPaymentCard, completionHandler: @escaping(Bool) -> Void) {
        let newCard = Payment(context: context)
        newCard.image = model.image
        newCard.name = model.name
        newCard.price = model.price
        newCard.category = model.category
        newCard.date = model.dateLimit
        
        do {
            try context.save()
            completionHandler(true)
        } catch {
            //error
        }
    }
    
    func deleteCard(card: Payment, completionHandler: @escaping (Bool) -> Void) {
        context.delete(card)
        do {
            try context.save()
            completionHandler(true)
        } catch {
            //error
            completionHandler(false)
        }
    }
    
    func editCard (card: Payment, model: ModelPaymentCard) {
        card.image = model.image
        card.name = model.name
        card.price = model.price
        card.category = model.category
        card.date = model.dateLimit
        
        do {
            try context.save()
        } catch {
            //error
        }
    }
    
}
