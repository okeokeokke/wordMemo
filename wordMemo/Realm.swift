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
    @objc dynamic var number: Int = 1
    @objc dynamic var japanese: String = ""
    @objc dynamic var status: Int = 0

}
