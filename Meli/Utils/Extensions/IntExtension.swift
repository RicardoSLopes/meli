//
//  IntExtension.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import Foundation

extension Int {
    func toCurrencyFormat() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        
        return formatter.string(from: NSNumber(value: self))
    }
}
