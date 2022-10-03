//
//  Dictionary+Extension.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//

import Foundation

extension Dictionary {
    
    /// create get request
    var queryString: String {
        var output: String = ""
        for (key,value) in self {
            output +=  "\(key)=\(value)&"
        }
        output = String(output.dropLast())
        output = "?" + output
        let newStr = output.replacingOccurrences(of: " ", with: "+")
        return newStr
    }
}
