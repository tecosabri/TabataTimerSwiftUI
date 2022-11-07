//
//  SetWorkoutItemViewModelFixture.swift
//  TabatUpTests
//
//  Created by Ismael Sabri Pérez on 2/11/22.
//

import Foundation
@testable import TabatUp

extension SetWorkoutItemViewModel {
    
    
    /// Returns a workout item view model with customizable properties that have a default value for test purposes.
    /// - Parameters:
    ///   - workoutOption: The option to be set.
    ///   - setWorkoutViewModel: The workout view model that will be generating the item for the workout option.
    /// - Returns: A workout item view model with customizable properties that have a default value for test purposes.
    static func fixture(workoutOption: SetWorkoutOption = .prepareTime, setWorkoutViewModel: SetWorkoutViewModel = SetWorkoutViewModel.fixture()) -> SetWorkoutItemViewModel {
        return SetWorkoutItemViewModel(workoutOption: workoutOption, fromSetWorkoutViewModel: setWorkoutViewModel)
    }
}
