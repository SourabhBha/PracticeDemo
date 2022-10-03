//
//  TaskData.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 20/09/22.
//

import Foundation

// MARK: - TaskData
struct TaskData: Codable {
    let count: Int
    let data: [Datum]
    
    init(){
        self.count = 0
        self.data = []
    }
    
}

// MARK: - Datum
struct Datum: Codable {
    let completed: Bool
    let id, datumDescription, owner, createdAt: String
    let updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case completed
        case id = "_id"
        case datumDescription = "description"
        case owner, createdAt, updatedAt
        case v = "__v"
    }
}
