//
//  NumPadViewModel.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 9/11/22.
//

import Foundation
import Combine

class NumPadViewModel: ObservableObject{
    // MARK: - Properties
    /// The value entered with the numpad.
    @Published var value: String
    /// Indicates whether the value is in seconds or in rounds
    var setWorkoutOption: SetWorkoutOption
    
    
    //MARK: - Lifecycle
    init(value: String = "", setWorkoutOption: SetWorkoutOption) {
        self.value = value
        self.setWorkoutOption = setWorkoutOption
    }
    
    // MARK: - Adding function
    /// Adds the number passed as argument to the value, removing leading zeroes.
    /// - Parameter number: The number to add to value.
    func add(number: Number) {
        removeLeadingZeroes()
        switch number {
        case .one:
            value.append(Number.one.rawValue)
        case .two:
            value.append(Number.two.rawValue)
        case .three:
            value.append(Number.three.rawValue)
        case .four:
            value.append(Number.four.rawValue)
        case .five:
            value.append(Number.five.rawValue)
        case .six:
            value.append(Number.six.rawValue)
        case .seven:
            value.append(Number.seven.rawValue)
        case .eight:
            value.append(Number.eight.rawValue)
        case .nine:
            value.append(Number.nine.rawValue)
        case .zero:
            value.append(Number.zero.rawValue)
        }
        checkMaxValue()
    }
    
    /// Removes leading zeroes from value.
    private func removeLeadingZeroes() {
        if value == "0" { value = "" }
    }
    
    
    /// Sets time values to maximum 3599 seconds and rounds to 99.
    private func checkMaxValue() {
        guard let value = Int(value) else { return }
        let valueIsRounds = isInRounds()
        if !valueIsRounds { self.value = Int(value) > 3599 ? "3599" : self.value } // Set max value for time value
        if valueIsRounds { self.value = Int(value) > 99 ? "99" : self.value } // Set max value for rounds value
    }
    
    /// Indicates whether the value is in rounds or in time.
    ///  - Returns: True if the value is in rounds.
    private func isInRounds() -> Bool {
        switch setWorkoutOption {
        case .cycles, .sets:
            return true
        case .title, .prepareTime, .workTime, .restBetweenCycles, .restBetweenSets:
            return false
        }
    }
    
    // MARK: - Delete function
    /// Deletes the last number of the value, doing nothing if the value is empty.
    func deleteNumber() {
        guard Int(value) != nil else { return } // Does nothing when empty value
        value.removeLast()
    }
    
    // MARK: - onDone function
    /// Updates the value of the item with the value set by this number pad, being 0 if empty value.
    func onDone(updateItem item: SetWorkoutItemViewModel) {
        // If empty value, set to 0 item value
        guard Int(value) != nil else {
            item.itemValue = "0"
            return
        }
        
        item.itemValue = value
    }
    
}
