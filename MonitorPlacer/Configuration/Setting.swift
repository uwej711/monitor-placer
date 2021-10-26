//
//  Setting.swift
//  MonitorPlacer
//
//  Created by Jäger Uwe on 31.10.21.
//

import Foundation
import Realm
import RealmSwift

class Setting: Object {
    var id: UInt32 = 0
    @Persisted var x: Int
    @Persisted var y: Int
    @Persisted var mode: Int32
    @Persisted var uuid: String
    
    convenience init(id: UInt32, uuid: String) {
        self.init()
        self.id = id
        self.uuid = uuid
    }
}
