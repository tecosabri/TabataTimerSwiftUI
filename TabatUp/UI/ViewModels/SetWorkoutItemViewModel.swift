//
//  SetWorkoutItemViewModel.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 28/10/22.
//

import Foundation

final class SetWorkoutItemViewModel: Identifiable, ObservableObject {
    
    // MARK: - Properties
    /// The value of the item.
    @Published var itemValue: String {
        didSet {
            isSet = true
        }
    }
    /// The option to be set for workout.
    let option: SetWorkoutOption
    /// Determines if a workout item value has been set
    var isSet: Bool = false
    
    // MARK: - Lifecycle
    /// Creates a set workout item view model from the view model for the setting option passed as parameter.
    /// - Parameters:
    ///   - option: The option to set.
    ///   - viewModel: The view model that integrates all the setting options.
    init(workoutOption option: SetWorkoutOption, fromSetWorkoutViewModel viewModel: SetWorkoutViewModel) {
        self.option = option
        switch option {
        case .title:
            itemValue = viewModel.title
        case .prepareTime:
            itemValue = viewModel.prepareTime
        case .workTime:
            itemValue = viewModel.workTime
        case .restBetweenCycles:
            itemValue = viewModel.restBetweenCycles
        case .cycles:
            itemValue = viewModel.cycles
        case .restBetweenSets:
            itemValue = viewModel.restBetweenSets
        case .sets:
            itemValue = viewModel.sets
        }
    }
}
