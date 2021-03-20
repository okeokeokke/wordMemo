//
//  WordListTableViewCell.swift
//  wordMemo
//
//  Created by 桶本あいか on 2021/02/27.
//

import UIKit

class WordListTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var englishWord: UITextField!
    @IBOutlet weak var wordCount: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        englishWord.delegate = self
        
        englishWord.isEnabled = false
//        englishWord.isEnabled = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        var detailViewController = segue.destination as! DetailViewController

        // Configure the view for the selected state
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
}
