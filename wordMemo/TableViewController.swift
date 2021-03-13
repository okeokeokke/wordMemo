//
//  TableViewController.swift
//  wordMemo
//
//  Created by 桶本あいか on 2021/02/13.
//

import UIKit
import RealmSwift

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let realm = try!Realm()
    var wordArray:Results<Word>!
    @IBOutlet var table: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        wordArray = realm.objects(Word.self)
        table.register(UINib(nibName: "WordListTableViewCell", bundle: nil),forCellReuseIdentifier:"wordListTableViewCell")
        wordArray = wordArray.sorted(byKeyPath: "number", ascending: false)
//        navigationItem.rightBarButtonItem = editButtonItem
//        self.editButtonItem.title = "編集"

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
    }
    
//    override func setEditing(_ editing: Bool, animated: Bool) {
//           //override前の処理を継続してさせる
//           super.setEditing(editing, animated: animated)
//           //tableViewの編集モードを切り替える
//        if(self.isEditing){
//            table.isEditing = true
//            navigationItem.rightBarButtonItem?.title = "完了"
//        }else{
//            table.isEditing = false
//            navigationItem.rightBarButtonItem?.title = "編集"
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordListTableViewCell") as! WordListTableViewCell
        cell.englishWord.text = wordArray[indexPath.row].english
        cell.wordCount.text = String(wordArray[indexPath.row].number)
        cell.accessoryType = .detailButton
//        cell.accessoryType = UITableViewCell.AccessoryType.detailButton
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "GoNext", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
