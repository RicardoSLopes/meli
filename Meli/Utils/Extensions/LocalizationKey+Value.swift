//
//  LocalizationKey+Value.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import Foundation

extension LocalizationKey {
    func value() -> String {
        return NSLocalizedString(self.rawValue, tableName: "Localizable", bundle: Bundle.main, value: "", comment: "")
    }
}
