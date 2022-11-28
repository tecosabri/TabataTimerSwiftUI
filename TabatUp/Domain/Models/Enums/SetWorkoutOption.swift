//
//  SetWorkoutOption.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 28/10/22.
//

import Foundation


/// A property of a workout.
enum SetWorkoutOption: String, CaseIterable {    
    case title = "Title"
    case prepareTime = "Warm up"
    case workTime = "Work time"
    case restBetweenCycles = "Cycle rest"
    case cycles = "Cycles"
    case restBetweenSets = "Set rest"
    case sets = "Sets"
}
