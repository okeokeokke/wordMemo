//
//  DetailViewController.swift
//  wordMemo
//
//  Created by 桶本あいか on 2021/03/13.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController, UITextFieldDelegate{
    
    let realm = try!Realm()
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    @IBOutlet var done: UIBarButtonItem!
    @IBOutlet var cancel: UIBarButtonItem!
    var selectedItem: Word!
    var wordArray:Results<Word>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UISet()
        englishTextField.delegate = self
        japaneseTextField.delegate = self
        wordArray = realm.objects(Word.self)
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func UISet() {
        englishTextField.text = selectedItem.english
        japaneseTextField.text = selectedItem.japanese
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func doneButton() {
        var results  = self.realm.objects(Word.self)
        results = results.filter("english =  '\(selectedItem.english)'")
        print("try前\(results)")
        try! self.realm.write {
            results[0].english = englishTextField.text!
            print("try中\(results)")
            results[0].japanese = japaneseTextField.text!
            
            self.realm.add(results)
        }
        let tabVc = self.presentingViewController as! UITabBarController
        let navigationVc = tabVc.selectedViewController as! UINavigationController
        let preVC = navigationVc.topViewController as! TableViewController
        preVC.table.reloadData()
        self.dismiss(animated: true, completion: nil)
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
