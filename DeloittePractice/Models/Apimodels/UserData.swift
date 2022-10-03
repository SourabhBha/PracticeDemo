//
//  UserData.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//

import Foundation

class EmptyClass: Encodable{
    
}

// MARK: - UserData
struct UserData: Codable {
    let user: User
    let token: String
}

// MARK: - User
struct User: Codable {
    let age: Int
    let id, name, email, createdAt: String
    let updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case age
        case id = "_id"
        case name, email, createdAt, updatedAt
        case v = "__v"
    }
}
