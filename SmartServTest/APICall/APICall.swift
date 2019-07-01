//
//  APICall.swift
//  SmartServTest
//
//  Created by Kondya on 01/07/19.
//  Copyright © 2019 Fortune4. All rights reserved.
//

import Foundation

class ApiCall{
    
    
    func getProductList(url: String,_ completion: @escaping (ProductDataModel) -> ()) {
        
       guard let url = URL(string:productListUrl) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                // Decode data to object
                let jsonDecoder = JSONDecoder()
                let productDataModel = try jsonDecoder.decode(ProductDataModel.self, from: data)
                completion(productDataModel)
            }
            catch {
                print("Error \(error)")
            }
        }
        task.resume()
    }
    
    
}
