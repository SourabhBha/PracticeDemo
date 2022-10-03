//
//  baseUrl.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 20/09/22.
//

import Foundation

enum BaseUrl: String{
   
   ///Login :-  Login Server Base Url
   case development = "https://api-nodejs-todolist.herokuapp.com/"
}

public struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    
    public static let delete = HTTPMethod(rawValue: "DELETE")
    /// `GET` method.
    public static let get = HTTPMethod(rawValue: "GET")
    /// `POST` method.
    public static let post = HTTPMethod(rawValue: "POST")
    /// `PUT` method.
    public static let put = HTTPMethod(rawValue: "PUT")

    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
