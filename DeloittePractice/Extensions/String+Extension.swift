//
//  Strinf+Extensions.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-za-z]{2,64}"
        let pred = NSPredicate(format: "SELF MATCHES %@", regex)
        return pred.evaluate(with: self)
    }
    
    /// Trims white space and new line characters, returns a new string
    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
