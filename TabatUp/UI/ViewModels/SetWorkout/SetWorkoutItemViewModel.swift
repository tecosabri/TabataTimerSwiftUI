//
//  SetWorkoutItemViewModel.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 28/10/22.
//

import SwiftUI
import Combine

final class SetWorkoutItemViewModel: ObservableObject {
    // MARK: - Properties
    /// The value of the item.
    @Published var itemValue: String {didSet {updateSetWorkoutViewModel()}}
    /// The workout view model that generates this item
    let setWorkoutViewModel: SetWorkoutViewModel
    /// The option to be set for workout.
    let option: SetWorkoutOption
    /// The last height value of the drag gesture
    var lastDragValueHeight: CGFloat = 0
    /// Indicates if the item has been tapped once.
    var isTapped = false
    
    // MARK: - Lifecycle
    /// Creates a set workout item view model from the view model for the setting option passed as parameter.
    /// - Parameters:
    ///   - option: The option to set.
    ///   - viewModel: The view model that integrates all the setting options.
    init(workoutOption option: SetWorkoutOption, fromSetWorkoutViewModel viewModel: SetWorkoutViewModel) {

        self.setWorkoutViewModel = viewModel
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
    
    // MARK: - Setting functions
    /// Assigns the item value to its option property in the set workout view model, keeping values in range 0-3599 or 0-100 depending on option.
    func updateSetWorkoutViewModel() {
    
        checkValueRange()
        
        switch option {
        case .title:
            setWorkoutViewModel.title = itemValue
        case .prepareTime:
            setWorkoutViewModel.prepareTime = itemValue
        case .workTime:
            setWorkoutViewModel.workTime = itemValue
        case .restBetweenCycles:
            setWorkoutViewModel.restBetweenCycles = itemValue
        case .cycles:
            setWorkoutViewModel.cycles = itemValue
        case .restBetweenSets:
            setWorkoutViewModel.restBetweenSets = itemValue
        case .sets:
            setWorkoutViewModel.sets = itemValue
        }
    }
    
    /// Keeps values in range 0-3599 or 0-100 depending on option indicating time or rounds.
    func checkValueRange() {
        guard let intValue = Int(itemValue) else { return }
        switch option {
        case .title:
            return
        case .prepareTime, .workTime, .restBetweenSets, .restBetweenCycles:
            if intValue > 3599 { itemValue = "3599"}
        case .sets, .cycles:
            if intValue > 99 { itemValue = "99"}
        }
        if intValue < 0 { itemValue = "0"}
    }
    
    /// Applies the offset to the value stored by this item and updates its set workout view model.
    /// - Parameter offSet: The positive or negative offset being applied by a dragging event.
    func onDraggedWith(offSet: CGFloat) {
        
        guard let intItemValue = itemValue.intValue else { return }
        // Title, cycles and sets options don't present this dragging behaviour
        guard option != .title && option != .cycles && option != .sets else { return }
        // Slow sensibility up to 1/2
        guard Int(offSet) % 2 == 0 else { return }
        // When dragging down
        if offSet > 0 {
            if lastDragValueHeight > offSet { itemValue = String(intItemValue + 1) } // Dragging down-up
            if lastDragValueHeight < offSet { itemValue = String(intItemValue - 1) } // Dragging down-down
        }
        // When dragging up
        else if offSet < 0 {
            if lastDragValueHeight > offSet { itemValue = String(intItemValue + 1) } // Dragging up-up
            if lastDragValueHeight < offSet { itemValue = String(intItemValue - 1)} // Dragging up-down
        }

        // Remember the last offset to know if dragged up-down, up-up, down-up or down-down
        lastDragValueHeight = offSet
    }
    
    /// Increments or decrements by one the value depending on the offset, being incremented if the offset is negative and decremented if positive. It also updates its set workout view model.
    /// - Parameter offSet: The positive or negative offset being applied by a dragging event-
    func onDragEndedWith(offSet: CGFloat) {
        
        guard let intItemValue = itemValue.intValue else { return }
        // Cycles and sets options are the options presenting this behaviour
        guard option == .cycles || option == .sets else { return }
        // When dragged up, increment value
        if offSet < 0 { itemValue = String(intItemValue + 1) }
        // When dragged down, decrement value
        if offSet > 0 { itemValue = String(intItemValue - 1) }
    }
    
    /// Updates the value of the item to its default value, updating the set workout model value.
    ///
    /// The default values are the following:
    /// - Title: "Default"
    /// - Prepare time: 10
    /// - Work time: 30
    /// - Rest between cycles: 10
    /// - Cycles: 4
    /// - Sets: 1
    /// - Rest between sets: 0
    func onTappedTwice() {
        let defaultViewModel = SetWorkoutViewModel(withWorkoutModel: SetWorkoutModel())
        switch option {
        case .title:
            itemValue = defaultViewModel.title
        case .prepareTime:
            itemValue = defaultViewModel.prepareTime
        case .workTime:
            itemValue = defaultViewModel.workTime
        case .restBetweenCycles:
            itemValue = defaultViewModel.restBetweenCycles
        case .cycles:
            itemValue = defaultViewModel.cycles
        case .restBetweenSets:
            itemValue = defaultViewModel.restBetweenSets
        case .sets:
            itemValue = defaultViewModel.sets
        }
    }
    
    /// Sets isTapped to true and updates de currently modified item in the set workout view model.
    func onTappedOnce() {
        isTapped = true
        setWorkoutViewModel.currentlyModifiedItem = self
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil) // Hide keyboard when tap once
    }
}


// MARK: - Extension equatable protocol
extension SetWorkoutItemViewModel: Equatable {
    static func == (lhs: SetWorkoutItemViewModel, rhs: SetWorkoutItemViewModel) -> Bool {
        lhs.itemValue == rhs.itemValue &&
        lhs.option == rhs.option
    }
}
