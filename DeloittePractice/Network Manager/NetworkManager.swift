//
//  NetworkManager.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//



import Foundation
import UIKit

//MARK: NetworkManager:- Established a Connection from server To client.
class NetworkManager {
    
    //Static instance to access over the application.
    static let sharedInstance = NetworkManager()
    
    //MARK: executeApi:- Api Execution to get data from the server.
    /// - Parameters:
    ///   - baseUrl: Server Base Url to communicate api with the  right Server.
    ///   - endPoint: end point of api to get exact Data fro api.
    ///   - methodType: HTTP method definitions.
    ///   - parameter: A dictionary of parameters to apply to a `URLRequest`.
    ///   - isShowActivityIndicator: When api is calling on that time show Progress bar With depend on the api.
    ///   - completionHandler: update in the Controller to give a response with Success either Failure.
    
    func executeApi<T:Codable, D:Encodable>(_ baseUrl: String, endPoint: String,reqModel:D?, methodType: HTTPMethod, parameter: [String: Any]?, resultType:T.Type, isShowLoader: Bool = true,viewController:UIViewController, completionHandler: @escaping (T?)-> Void){
        
        self.isCheckInternetConnection(viewController:viewController)
        let url = urlEncoding(baseUrl, endPoint: endPoint, viewController:viewController)
        print("♺ ⭕️\(String(describing: url!))")
        /// Create a Url Request.
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = methodType.rawValue
        urlRequest.cachePolicy = .reloadIgnoringCacheData
        
        if methodType == .post{
            // <<== Cache disabled
            let jsonData = try? JSONEncoder().encode(reqModel)
            
            if let JSONString = String(data: jsonData!, encoding: String.Encoding.utf8) {
                print("API request",JSONString)
            }
            urlRequest.httpBody = jsonData
        }
        
        let token = Utility().getUserToken()
        
        if token != ""{
            urlRequest.setValue("Bearer " + (token), forHTTPHeaderField: "Authorization")
        }
     
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if isShowLoader{
            DispatchQueue.main.async {
                self.showNetworkActivity(show: true)
                Utility.isLoader(visible: true)
            }
        }
        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            if isShowLoader{
                DispatchQueue.main.async {
                    Utility.isLoader(visible: false)
                }
            }
            if(data != nil && data?.count != 0)
            {
                do {
                    //print(String(data: data!, encoding: .utf8))
                    let response = try JSONDecoder().decode(T.self, from: data!)
                    _=completionHandler(response)
                }
                
                catch let decodingError {
                    DispatchQueue.main.async {
                        viewController.showAlert(message: String(data: data!, encoding: .utf8) ?? "")
                    }
                    
                    debugPrint(decodingError)
                }
            }else{
                var code = NSURLErrorUnknown
                
                if  error != nil {
                    code = (error! as NSError).code
                }
                
                let msg = self.prepareErrorResponce(code: code)
                
                viewController.showAlert(message: msg)
                
            }
        }.resume()
    }
        
    /// - Parameter show: true to show/false to hide
    private func showNetworkActivity(show:Bool){
        //show loader
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = show
        }
    }

    /// isCheckInternetConnection : Internet Connection is available or not
    func isCheckInternetConnection(viewController:UIViewController){
        guard Reachability.isConnectedToNetwork() == true else{
            DispatchQueue.main.async {
                
                Utility.isLoader(visible: false)
                self.showNetworkActivity(show: false)
                viewController.showAlert(message: "Please connect with Internet")
            }
            
            return
        }
    }
    
    func urlEncoding(_ baseUrl: String, endPoint: String, viewController: UIViewController) -> URL? {
        
        /// Combination of base url and end point with QueryAllowd characters.
        let url = URL(string: (baseUrl + endPoint).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
        
        // Check  url is Valid or not.
        guard url != nil else {
            DispatchQueue.main.async {
                viewController.showAlert(message: "url is Incorrect")
//                serviceAlertMessage("url is Incorrect", message: "Invalid url")
            }
            return nil
        }
        return url
    }
    
    /// Prepare error message according to Error Code
    ///
    /// - Parameter code: code
    /// - Returns: Message
    private func prepareErrorResponce(code: Int) -> String {
        
        var msg = ""
        switch code{
        case NSURLErrorTimedOut:
            msg = ErrorMsg.msgRequestTimeOut
        case NSURLErrorNotConnectedToInternet,NSURLErrorCannotConnectToHost:
            msg = ErrorMsg.msgNoInternet
        case NSURLErrorNetworkConnectionLost:
            msg = ErrorMsg.msgConnectionLost
        default:
            msg = ErrorMsg.msgServerError
        }
        
        return msg
    }
    
    /// Error message
    struct ErrorMsg {
        static let msgNoInternet       = "Please check your network connectivity and try again"
        static let msgConnectionLost   = "Connection lost. Please check your network connectivity"
        static let msgServerError      = "Something went wrong, please try again"
        static let msgRequestTimeOut   = "Request time out, please try again"
        static let msgNoRecord         = "No record found"
    }
}
