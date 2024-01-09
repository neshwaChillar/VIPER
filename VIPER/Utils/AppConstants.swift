//
//  AppConstants.swift
//  VIPER
//
//  Created by Neshwa on 20/12/23.
//

import Foundation

let baseURL = "https://newsapi.org/v2/everything?q=tesla&from=2023-11-20&sortBy=publishedAt&apiKey=11049b561eaf462e98160b5c1008f6ce"

enum EndPoints {
    
    case noticeList
    case movieList
    
    var path : String {
        
        switch self {
            
        case .noticeList :
            return "1bsqcn/"
            
        case .movieList:
            return "1h87n6"
        }
    }
}
