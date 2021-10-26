//
//  Configuration.swift
//  MonitorPlacer
//
//  Created by Jäger Uwe on 31.10.21.
//

import Foundation
import Realm
import RealmSwift

class Configuration: Object {
    @Persisted var id: String
    @Persisted var settings: List<Setting>
}
