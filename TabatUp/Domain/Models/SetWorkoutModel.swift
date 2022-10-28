//
//  SetWorkoutModel.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 28/10/22.
//

import Foundation

/// A workout represented by a unique title.
struct SetWorkoutModel {
    // MARK: - Properties
    /// The title of the workout: an empty string by default.
    var title: String = ""
    /// The time to prepare before the whole workout starts: 10 seconds by default.
    var prepareTime: Int = 10
    /// The round workout time: 30 seconds by default.
    var workTime: Int = 30
    /// The rest time between cycles: 10 seconds by default.
    var restBetweenCycles: Int = 10
    /// The number of cycles in each set: 4 cycles by default.
    var cycles: Int = 4
    /// The number of sets in the workout: 1 set by default.
    var sets: Int = 1
    /// The rest time between sets: no rest by default.
    var restBetweenSets: Int = 0
}
