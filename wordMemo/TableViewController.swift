//
//  TableViewController.swift
//  wordMemo
//
//  Created by 桶本あいか on 2021/02/13.
//

import UIKit
import RealmSwift

class TableViewController: UIViewController, UITableViewDataSource {
    
    let realm = try!Realm()
    var wordArray:Results<Word>!
    @IBOutlet var table: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        wordArray = realm.objects(Word.self)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = wordArray[indexPath.row].english
        return cell!
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
