//
//  SetWorkoutItemViewModel.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 28/10/22.
//

import Foundation

final class SetWorkoutItemViewModel {
    
    // MARK: - Properties
    var itemValue: String
    let option: SetWorkoutOption
    
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
