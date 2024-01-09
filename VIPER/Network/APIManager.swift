//
//  APIManager.swift
//  VIPER
//
//  Created by Neshwa on 20/12/23.
//

import Foundation
import Alamofire

protocol APIManagerProtocol {
    func fetchData<T: Codable>(completion: @escaping (Result<T, Error>) -> Void)
}

class APIManager : APIManagerProtocol {
    
    //MARK: Generics function for Api Integration
    func fetchData<T : Codable>(completion: @escaping (Result<T, Error>) -> Void) where T : Codable {
        
        var url = baseURL
        
            AF.request(url).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    
    private var reachabilityManager: NetworkReachabilityManager?
    
    init() {
        reachabilityManager = NetworkReachabilityManager()
        }
    
    //MARK: To chech whether network available or not before api request
    func isNetworkReachable() -> Bool {
           return reachabilityManager?.isReachable ?? false
       }
    
    //MARK: Function to show alert
    private func showAlert(title: String, message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            // Assuming you have access to the topmost view controller
        if let topViewController = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow})
                .first?.rootViewController {
                
                topViewController.present(alertController, animated: true, completion: nil)
            }
        }
    
    
}

