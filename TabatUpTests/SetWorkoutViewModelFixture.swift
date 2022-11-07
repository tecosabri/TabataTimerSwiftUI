//
//  SetWorkoutViewModelFixture.swift
//  TabatUpTests
//
//  Created by Ismael Sabri Pérez on 2/11/22.
//

import Foundation
@testable import TabatUp

extension SetWorkoutViewModel {
    
    /// Returns a workout view model with customizable properties that have a default value for test purposes.
    /// - Parameters:
    ///   - title: The title of the testing workout.
    ///   - prepareTime: The time to prepare before the whole workout starts.
    ///   - workTime: The round workout time.
    ///   - restBetweenCycles: The rest time between cycles.
    ///   - cycles: The number of cycles in each set.
    ///   - sets: The number of sets in the workout.
    ///   - restBetweenSets: The rest time between sets.
    /// - Returns: A workout view model  with customizable properties that have a default value for test purposes.
    static func fixture(title: String = "NoTitle",
                        prepareTime: Int = 10,
                        workTime: Int = 30,
                        restBetweenCycles: Int = 10,
                        cycles: Int = 4,
                        sets: Int = 1,
                        restBetweenSets: Int = 0) -> SetWorkoutViewModel {
        return SetWorkoutViewModel(withWorkoutModel: SetWorkoutModel(
            title: title,
            prepareTime: prepareTime,
            workTime: workTime,
            restBetweenCycles: restBetweenCycles,
            cycles: cycles,
            sets: sets,
            restBetweenSets: restBetweenSets))
    }
}
