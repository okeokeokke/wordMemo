//
//  WordListTableViewCell.swift
//  wordMemo
//
//  Created by 桶本あいか on 2021/02/27.
//

import UIKit

class WordListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var englishWord: UILabel!
    @IBOutlet weak var wordCount: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
