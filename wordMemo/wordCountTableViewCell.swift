//
//  wordCountTableViewCell.swift
//  wordMemo
//
//  Created by 桶本あいか on 2021/02/20.
//

import UIKit

class wordCountTableViewCell: UITableViewCell {
    
    @IBOutlet weak var english: UIImageView!
    @IBOutlet weak var count: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
