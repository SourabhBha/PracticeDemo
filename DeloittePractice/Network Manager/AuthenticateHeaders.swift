//  AuthenticateHeaders.swift
//  ClassMonitor
//  Created by Apple on 10/02/20.
//  Copyright © 2020 Apple. All rights reserved.

import UIKit
import Foundation


//MARK:  authorizationHeader to give exact Authrization to comminicate with Servers.
/// - Parameter serverSession: using a Server Key it Authorize and update barier token accroding to  Server utl
/// - Returns: common header for http request
public func authorizationHeader(_ serverSession: String?) -> HTTPHeaders{
    
    var headerAuthorization = [String: String]()

    let token = Utility().getUserToken()
    
    if token != ""{
        headerAuthorization = ["Authorization":"Bearer " + (token) ]
    }
    
    // Basic Authorisation  for all Servers.
    headerAuthorization["Accept"] = "application/json"
    //headerAuthorization["Content-Type"] = "application/json"
    headerAuthorization["Content-Type"] = "application/json"

    return HTTPHeaders(headerAuthorization)
}

