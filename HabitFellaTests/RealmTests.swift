//
//  RealmTests.swift
//  HabitFellaTests
//
//  Created by Cem Ergin on 04/10/2022.
//

import XCTest
import RealmSwift
@testable import HabitFella

final class RealmTests: XCTestCase {
    func test_Realm_ShouldWriteGivenHabitToDatabase () {
        let realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: UUID().uuidString))
        
        
        let rgba = UIColor.green.rgba
        let name = "habitOne"
        let isDone = true
        let icon = "bell"
        let color = Color(
            value:
                [
                    "red": rgba.red,
                    "green": rgba.green,
                    "blue": rgba.blue,
                    "alpha": rgba.alpha
                ]
        )
        let tags = ["tag1", "tag2"]
        let goalCount = 1
        let goalUnit = "count"
        let goalFrequency = FrequencyType.daily.rawValue
        let reminderTime = Time(
            value:
                [
                    "hour" : 12,
                    "minute": 56,
                ]
        )
        let reminderMessage = "Don't forget to complete your habit today"
        let startDate = Date()
        let endDate = Date()
        
        
        let _tags = List<String>()
        _tags.append(objectsIn: tags)
        let habit = Habit()
        habit.name = name
        habit.isDone = isDone
        habit.icon = icon
        habit.color = color
        habit.tags = _tags
        habit.goalCount = goalCount
        habit.goalUnit = goalUnit
        habit.goalFrequency = goalFrequency
        habit.reminderTime = reminderTime
        habit.reminderMessage = reminderMessage
        habit.startDate = startDate
        habit.endDate = endDate
        
        try! realm.write {
            realm.add(habit)
        }
        
        let realmHabit = realm.objects(Habit.self).first
        XCTAssertEqual(realmHabit?.name, name)
        XCTAssertEqual(realmHabit?.isDone, isDone)
    }
}
