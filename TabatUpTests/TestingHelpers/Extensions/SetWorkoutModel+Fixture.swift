//
//  SetWorkoutModel+Fixture.swift
//  TabatUpTests
//
//  Created by Ismael Sabri Pérez on 28/10/22.
//

import Foundation
@testable import TabatUp

extension SetWorkoutModel {
    
    /// Returns a workout with customizable properties that have a default value for test purposes.
    /// - Parameters:
    ///   - title: The title of the testing workout.
    ///   - prepareTime: The time to prepare before the whole workout starts.
    ///   - workTime: The round workout time.
    ///   - restBetweenCycles: The rest time between cycles.
    ///   - cycles: The number of cycles in each set.
    ///   - sets: The number of sets in the workout.
    ///   - restBetweenSets: The rest time between sets.
    /// - Returns: A workout with customizable properties that have a default value for test purposes.
    static func fixture(title: String = "NoTitle",
                        prepareTime: Int = 10,
                        workTime: Int = 30,
                        restBetweenCycles: Int = 10,
                        cycles: Int = 4,
                        sets: Int = 1,
                        restBetweenSets: Int = 0) -> SetWorkoutModel {
        return SetWorkoutModel(
            title: title,
            workTime: workTime,
            restBetweenCycles: restBetweenCycles,
            cycles: cycles,
            sets: sets,
            restBetweenSets: restBetweenSets)
    }
}
