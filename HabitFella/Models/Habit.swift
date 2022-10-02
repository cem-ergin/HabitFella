//
//  File.swift
//  HabitFella
//
//  Created by Cem Ergin on 02/10/2022.
//

import Foundation
import Realm
import RealmSwift

class Habit: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name = ""
    @Persisted var isDone: Bool = false
}

