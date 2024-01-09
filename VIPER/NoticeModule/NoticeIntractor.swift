//
//  NoticeIntractor.swift
//  VIPER
//
//  Created by Neshwa on 20/12/23.
//

import Foundation

class NoticeIntractor : PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    private let apiManager: APIManagerProtocol

        init(apiManager: APIManagerProtocol) {
            self.apiManager = apiManager
        }
    
    func fetchNotice() {
        
        apiManager.fetchData { [self] (result: Result<NoticeModel, Error>) in
            switch result {
                
                case .success(let data):
                    print(data)
                presenter?.noticeFetchedSuccess(data: [data])
                
                case .failure(let error):
                    print(error)
                presenter?.noticeFetchedFailure(error: error)
            }
        }
    }
    
    
  
}
