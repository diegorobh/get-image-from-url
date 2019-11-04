//
//  Requests.swift
//  Summary
//
//  Created by diego paredes on 21/10/19.
//  Copyright © 2019 Wilman Rojas. All rights reserved.
//

import Foundation

struct requestInfo {
    var url = String()
    var method = String()
    var parameters = [String:Any]()
}

class Requests {
    
    static func generalRequest (urlArg: String, paramsArg: Any, methodArg: String, accesstokenArg:String = "", responseData: @escaping (_ data: Data) -> ()) {
        
        guard let url = URL(string: urlArg) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = methodArg
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(accesstokenArg)", forHTTPHeaderField: "Authorization")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: paramsArg, options: []) else { return }
        if methodArg != "GET" {
            request.httpBody = httpBody
        }
        
        let session = URLSession.shared
        session.dataTask(with: request){ (data, response, error) in
            do{
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode >= 200 && httpResponse.statusCode < 400 {
                        //                       print(String(httpResponse.statusCode))
                        if let data = data {
                            do {
                                responseData(data)
                            }
                        }
                    } else {
                        print("Error: " + String(httpResponse.statusCode))
                        responseData(Data(String(httpResponse.statusCode).utf8))
                    }
                }
            }
            }.resume()
    }
    
}


