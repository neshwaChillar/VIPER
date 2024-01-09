//
//  NoticeTableViewCell.swift
//  VIPER
//
//  Created by Neshwa on 20/12/23.
//

import UIKit

class NoticeTableViewCell: UITableViewCell {

    @IBOutlet weak var noticeTitle: UILabel!
    @IBOutlet weak var noticeBrief: UITextView!
    @IBOutlet weak var noticeFileSource: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
