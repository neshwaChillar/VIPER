//
//  NoticeProtocol.swift
//  VIPER
//
//  Created by Neshwa on 20/12/23.
//

import Foundation

protocol ViewToPresenterProtocol : AnyObject {
    //fetch data
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
        
    func startfetching()
}

protocol PresenterToInteractorProtocol : AnyObject {
    // fetch notices
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchNotice()
}

protocol InteractorToPresenterProtocol : AnyObject {
    // fetch response data from api call
    func noticeFetchedSuccess(data: [NoticeModel])
    func noticeFetchedFailure(error: Error)
}

protocol PresenterToViewProtocol : AnyObject {
    // fetch data to show in view
    func showNotice(data: [NoticeModel])
    func showError()
}
 
