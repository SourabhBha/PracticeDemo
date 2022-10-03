//
//  SignupRequest.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 20/09/22.
//

import Foundation

struct SignupRequest: Codable{
    let name, email, password: String?
    let age: Int?
}


