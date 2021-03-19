//
//  WordTestViewController.swift
//  wordMemo
//
//  Created by 桶本あいか on 2021/03/06.
//

import UIKit
import RealmSwift

class WordTestViewController: UIViewController {
    
    let realm = try!Realm()
    var wordArray:Results<Word>!
    @IBOutlet var testJapanese: UILabel!
    @IBOutlet var testEnglish: UILabel!
    @IBOutlet var yes: UIButton!
    @IBOutlet var no: UIButton!
    @IBOutlet var showJapanese: UIButton!
    var index: Int = 0
    var quantity: Int?
    var statusIndex: Int = 2
    


    override func viewDidLoad() {
        super.viewDidLoad()
        wordArray = realm.objects(Word.self)
        wordArray = wordArray.sorted(byKeyPath: "number", ascending: false)
        setUI()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUI()
    }
    
    func setUI() {
        quantity = wordArray.count
        if quantity == 0 {
            testEnglish.text = ""
            testJapanese.text = ""
        } else {
            testEnglish.text = wordArray[index].english
            testJapanese.text = wordArray[index].japanese
        }
        
    }
    
    func perfect() {
        if wordArray[index].status > 1  {
            
        }
    }
    
    func delete() {
        if wordArray[index].status > statusIndex{
            let array = self.wordArray[index]
            var results  = self.realm.objects(Word.self)
            results = results.filter("english =  '\(array.english)'")
            do {
                let realm = try Realm()
                try! realm.write {
                    realm.delete(results)
                    realm.delete(array)
                }
            } catch {
            }
        }
    }
    
    
    @IBAction func memorize() {
        if wordArray.count == 0 {
            testEnglish.text = ""
            testJapanese.text = ""
        }else{
            if wordArray[index].status > statusIndex{
                let array = self.wordArray[index]
                var results  = self.realm.objects(Word.self)
                results = results.filter("english =  '\(array.english)'")
                do {
                    let realm = try Realm()
                    try! realm.write {
                        realm.delete(results)
                        realm.delete(array)
                    }
                } catch {
                }
            } else {
                try! self.realm.write {
                    wordArray[index].status += 1
                    self.realm.add(wordArray[index])
                }
            }
            if wordArray.count == 0 {
                testEnglish.text = ""
                testJapanese.text = ""
            } else {
                if index < wordArray.count - 1 {
                    index += 1
                }
                else if index == wordArray.count - 1{
                    index = 0
                }
                testEnglish.text = wordArray[index].english
                testJapanese.text = wordArray[index].japanese
            }
        }
        
        
        
//        testEnglish.text = wordArray[index].english
//        testJapanese.text = wordArray[index].japanese
    }
    
    @IBAction func notMemorize() {
        if wordArray.count == 0 {
            testEnglish.text = ""
            testJapanese.text = ""
        }else{
            if index < wordArray.count - 1 {
                index += 1
            }
            else if index == wordArray.count - 1{
                index = 0
            }
            testEnglish.text = wordArray[index].english
            testJapanese.text = wordArray[index].japanese
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
