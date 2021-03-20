//
//  TableViewController.swift
//  wordMemo
//
//  Created by 桶本あいか on 2021/02/13.
//

import UIKit
import RealmSwift

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    
    
    let realm = try!Realm()
    var wordArray:Results<Word>!
    @IBOutlet var table: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    var selectedItem: Word!
    var index: Int!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        wordArray = realm.objects(Word.self)
        table.register(UINib(nibName: "WordListTableViewCell", bundle: nil),forCellReuseIdentifier:"wordListTableViewCell")
        wordArray = wordArray.sorted(byKeyPath: "number", ascending: false)
        //        navigationItem.rightBarButtonItem = editButtonItem
        //        navigationItem.rightBarButtonItem = editButtonItem
        //        self.editButtonItem.title = "編集"
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
    }
    
    
    @IBAction func setEditing() {
        if(table.isEditing){
            table.isEditing = false
            editButton.title = "編集"
            
            
        }else{
            table.isEditing = true
            editButton.title = "完了"
           
            //            self.editButtonItem.title = "編集"
            //            navigationItem.rightBarButtonItem?.title = "編集"
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! WordListTableViewCell
        cell.englishWord.text = wordArray[indexPath.row].english
        cell.wordCount.text = String(wordArray[indexPath.row].number)
        cell.englishWord.isEnabled = table.isEditing
        
        //        cell.accessoryType = .detailButton
        //        cell.accessoryType = UITableViewCell.AccessoryType.detailButton
        return cell
    }
    
    func tableView(_ tableView: UITableView,canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //削除するだけなのでindexPath_row = indexPath.rowをする必要はない。
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let array = self.wordArray[indexPath.row]
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
            //            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            table.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        selectedItem = wordArray[indexPath.row]
        index = indexPath.row
        performSegue(withIdentifier: "GoNext", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoNext" {
            var detailViewController = segue.destination as! DetailViewController
            detailViewController.selectedItem = self.selectedItem
            detailViewController.index = self.index
            
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing == true{
            return .delete
        }else{
            return .none
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


