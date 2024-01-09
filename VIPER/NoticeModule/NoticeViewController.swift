//
//  NoticeViewController.swift
//  VIPER
//
//  Created by Neshwa on 20/12/23.
//

import UIKit

class NoticeViewController: UIViewController {

    @IBOutlet weak var noticeTable: UITableView!
    
     let presenter = NoticePresenter()
    
    var noticeData : [NoticeModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.startfetching()
        noticeTable.delegate = self
        noticeTable.dataSource = self
    }

}

extension NoticeViewController : UITableViewDataSource, UITableViewDelegate, PresenterToViewProtocol {
    
    func showNotice(data: [NoticeModel]) {
        self.noticeData = data
        noticeTable.reloadData()
    }
    
    func showError() {
        print("Error")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell") as? NoticeTableViewCell else {
            return UITableViewCell()
        }
        
        cell.noticeTitle.text = noticeData?.first?.articles[indexPath.row].title
        cell.noticeBrief.text = noticeData?.first?.articles[indexPath.row].description
        cell.noticeFileSource.text = noticeData?.first?.articles[indexPath.row].url
        return UITableViewCell()
    }
    
    
}
