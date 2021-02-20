//
//  Realm.swift
//  wordMemo
//
//  Created by 桶本あいか on 2021/02/13.
//

import Foundation
import RealmSwift

class Word: Object{
    @objc dynamic var english: String = ""
    @objc dynamic var wordCount: Int = 0

}
