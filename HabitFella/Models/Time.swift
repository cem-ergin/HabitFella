//
//  Time.swift
//  HabitFella
//
//  Created by Cem Ergin on 04/10/2022.
//

import Foundation
import RealmSwift

class Time: Object {
    @Persisted var hour: Int
    @Persisted var minute: Int 
}
