//
//  CardPresenter.swift
//  ToDoPayments
//
//  Created by Jesus Gonzalez on 19/11/24.
//

import Foundation
import UIKit

class CardPresenter {
    
    func operationOfPaymentDivided(price: String, numberOfPersons: String) -> String {
        
        guard let price = Float(price), let numberOfPersons = Float(numberOfPersons) else { return "0" }
        let operation = (price / numberOfPersons)
        return String(format: "%.2f", (operation))
        
    }
    
    func keyboardSettings(text: String ,tag: Int, range: NSRange, string: String) -> Bool {
        return switch tag {
            
        case 0:
            limitOfText(text: text, range: range, string: string)
        case 1:
            limitOfNumberOfPersons(string: string,text: text, range: range)
        case 2:
            limitOfPrice(string: string, text: text, range: range)
        default:
            true
        }
    }
    
    func typeOfKeyboard(tag: Int) -> UIKeyboardType {
        return switch tag {
        case 1:
                .numberPad
        case 2:
                .decimalPad
        default:
                .default
        }
    }
    
    private func limitOfText(text: String, range: NSRange, string: String) -> Bool {
        guard let rangeString = Range(range, in: text) else { return false }
        let finalText = text.replacingCharacters(in: rangeString, with: string)
        return finalText.count < 30
    }
    
    private func limitOfNumberOfPersons(string: String,text: String, range: NSRange) -> Bool{
        if string.isEmpty {
            return true
        }
        
        guard let _ = Int(string) else {
            return false
        }
        
        guard let stringRange = Range(range, in: text) else {
            return false
        }
        let updatedText = text.replacingCharacters(in: stringRange, with: string)
        
        if let newValue = Int(updatedText), newValue >= 2 && newValue <= 99 {
            return true
        }
        
        return false
    }
    
    private func limitOfPrice (string: String,text: String, range: NSRange) -> Bool{
        if string.isEmpty {
            return true
        }
        
        guard let _ = Float(string) else {
            return false
        }
        
        guard let stringRange = Range(range, in: text) else {
            return false
        }
        let updatedText = text.replacingCharacters(in: stringRange, with: string)
        
        if let newValue = Float(updatedText), newValue >= 1 && newValue <= 99999 {
            return true
        }
        
        //        if let _ = updatedText.range(of: CardCommonConstants.regex, options: .regularExpression) {
        //            return true
        //        }
        return false
    }
}

