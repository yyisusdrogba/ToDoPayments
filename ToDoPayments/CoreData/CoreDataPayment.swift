//
//  CoreDataPayment.swift
//  ToDoPayments
//
//  Created by Jesus Gonzalez on 25/11/24.
//

import Foundation
import UIKit

class CoreDataPayment {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var cards: [Payment] = []
    
    func getAllCards() {
        do {
            cards = try context.fetch(Payment.fetchRequest())
        } catch {
            //error
        }
    }
    
    func createCard(model: ModelPaymentCard) {
        let newCard = Payment(context: context)
        newCard.image = model.image
        newCard.name = model.name
        newCard.price = model.price
        newCard.category = model.category
        newCard.date = model.dateLimit
        
        do {
            try context.save()
        } catch {
            //error
        }
    }
    
    func deleteCard(card: Payment) {
        context.delete(card)
        
        do {
            try context.save()
        } catch {
            //error
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
