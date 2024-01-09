//
//  NoticePresenter.swift
//  VIPER
//
//  Created by Neshwa on 20/12/23.
//

import Foundation

class NoticePresenter : ViewToPresenterProtocol, InteractorToPresenterProtocol {
    
    var view : PresenterToViewProtocol?
    var interactor : PresenterToInteractorProtocol?
    
    func noticeFetchedSuccess(data: [NoticeModel]) {
        view?.showNotice(data: data)
    }
    
    func noticeFetchedFailure(error: Error) {
        view?.showError()
    }
    
    func startfetching() {
        interactor?.fetchNotice()
    }
    
    
}
