//
//  ViewController.swift
//  wordMemo
//
//  Created by 桶本あいか on 2021/02/13.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate{
    
    let realm = try!Realm()
    var wordArray:Results<Word>!
    @IBOutlet var titleTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        // Do any additional setup after loading the view.
        wordArray = realm.objects(Word.self)
        print(wordArray)
    }
    

    @IBAction func plusWord(){
        var wordTextField = UITextField()
        let word = Word()
        
        let addWord = UIAlertController(title: "単語名を入力", message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
           
            var textWord = wordTextField.text!
            var results = self.realm.objects(Word.self)
            results = results.filter("english == '\(textWord)'")
            print(results)
            if results.count == 0 {
                word.english = textWord
                try! self.realm.write {
                    self.realm.add(word)
                }
                print("filter")
            } else {
                results[0].wordCount += 1
                print("else")
            }
        
            print(word,"ワード")
        }
        let cancel = UIAlertAction(title: "キャンセル", style: .cancel) { (action) in
//
        }
        addWord.addTextField { (textField) in
            textField.placeholder = "英単語"
            wordTextField = textField
        }
        addWord.addAction(cancel)
        addWord.addAction(ok)
        present(addWord, animated: true, completion: nil)
        
    }
    @IBAction func addEnglishWord() {
        
    }
    
    @IBAction func save() {
        let word = Word()
        word.english = titleTextField.text!
        try! realm.write {
            realm.add(word)
        }
    }
    


}

