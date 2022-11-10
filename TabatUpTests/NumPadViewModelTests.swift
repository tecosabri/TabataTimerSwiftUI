//
//  NumPadViewModelTests.swift
//  TabatUpTests
//
//  Created by Ismael Sabri Pérez on 10/11/22.
//

import XCTest
@testable import TabatUp

final class NumPadViewModelTests: XCTestCase {

    // MARK: - addNumber
    func test_addNumber_whenAddedNumbers_valueChanges() {
        // Given a numpad view model
        let numPadViewModel = NumPadViewModel(setWorkoutOption: .prepareTime)
        XCTAssertEqual(numPadViewModel.value, "")
        // When added some numbers
        numPadViewModel.add(number: .one)
        numPadViewModel.add(number: .two)
        numPadViewModel.add(number: .three)
        numPadViewModel.add(number: .four)
        // Then the value gets updated
        XCTAssertEqual(numPadViewModel.value, "1234")
    }
    
    func test_addNumber_whenAddedZeroToEmptyValue_valueIsZero() {
        // Given a numpad view model
        let numPadViewModel = NumPadViewModel(setWorkoutOption: .prepareTime)
        XCTAssertEqual(numPadViewModel.value, "")
        // When added some numbers
        numPadViewModel.add(number: .zero)
        // Then the value gets updated
        XCTAssertEqual(numPadViewModel.value, "0")
    }

    func test_addNumber_whenAddedZeroAsFirstValueAndThenOtherNumber_zeroGetsRemoved() {
        // Given a numpad view model
        let numPadViewModel = NumPadViewModel(setWorkoutOption: .prepareTime)
        XCTAssertEqual(numPadViewModel.value, "")
        // When added some numbers
        numPadViewModel.add(number: .zero)
        numPadViewModel.add(number: .three)
        // Then zero gets removed
        XCTAssertEqual(numPadViewModel.value, "3")
    }
    
    func test_addNumber_whenAddedMoreThanOneHourWhenValueIsInTime_valueIsOneSecondToOneHour() {
        // Given a numpad view model
        let numPadViewModel = NumPadViewModel(setWorkoutOption: .prepareTime)
        XCTAssertEqual(numPadViewModel.value, "")
        // When added 3600 seconds
        numPadViewModel.add(number: .three)
        numPadViewModel.add(number: .six)
        numPadViewModel.add(number: .zero)
        numPadViewModel.add(number: .zero)
        // Then value is 3599 seconds
        XCTAssertEqual(numPadViewModel.value, "3599")
    }
    
    func test_addNumber_whenAddedMoreThanOneHundredRounds_valueIsNinetyNineRounds() {
        // Given a numpad view model
        let numPadViewModel = NumPadViewModel(setWorkoutOption: .sets)
        XCTAssertEqual(numPadViewModel.value, "")
        // When added 100 rounds
        numPadViewModel.add(number: .one)
        numPadViewModel.add(number: .zero)
        numPadViewModel.add(number: .zero)
        // Then value is 99 rounds
        XCTAssertEqual(numPadViewModel.value, "99")
    }
    
    // MARK: - deleteNumber
    func test_deleteNumber_whenPressedAndValueContainsANumber_deletesNumber() {
        // Given a numpad view model with 80 sets
        let numPadViewModel = NumPadViewModel(setWorkoutOption: .sets)
        XCTAssertEqual(numPadViewModel.value, "")
        numPadViewModel.add(number: .eight)
        numPadViewModel.add(number: .zero)
        // When deleted number
        numPadViewModel.deleteNumber()
        // Then the value is 8
        XCTAssertEqual(numPadViewModel.value, "8")
    }
    
    func test_deleteNumber_whenPressedAndValueContainsZero_deletesZeroAndGetsEmptyValue() {
        // Given a numpad view model with empty value
        let numPadViewModel = NumPadViewModel(setWorkoutOption: .sets)
        XCTAssertEqual(numPadViewModel.value, "")
        numPadViewModel.add(number: .zero)
        XCTAssertEqual(numPadViewModel.value, "0")
        // When deleted number
        numPadViewModel.deleteNumber()
        // Then the value is empty
        XCTAssertEqual(numPadViewModel.value, "")
    }
    
    func test_deleteNumber_whenPressedAndValueIsEmpty_doesNothing() {
        // Given a numpad view model with empty value
        let numPadViewModel = NumPadViewModel(setWorkoutOption: .sets)
        XCTAssertEqual(numPadViewModel.value, "")
        // When deleted number
        numPadViewModel.deleteNumber()
        // Then the value is still empty
        XCTAssertEqual(numPadViewModel.value, "")
    }
    
    // MARK: - onDone
    func test_onDoneUpdateItem_whenPressedWithEmptyValue_itemValueUpdatesTo0() {
        // Given a numpad view model with empty value and a random item
        let numPadViewModel = NumPadViewModel(setWorkoutOption: .sets)
        XCTAssertEqual(numPadViewModel.value, "")
        let item = SetWorkoutItemViewModel.fixture(workoutOption: .sets)
        // When the onDone
        numPadViewModel.onDone(updateItem: item)
        // Item value is 0
        XCTAssertEqual(item.itemValue, "0")
    }
    
    func test_onDoneUpdateItem_whenPressedWithValue_itemValueUpdates() {
        // Given a numpad view model with 579 seconds
        let numPadViewModel = NumPadViewModel(setWorkoutOption: .prepareTime)
        XCTAssertEqual(numPadViewModel.value, "")
        let item = SetWorkoutItemViewModel.fixture(workoutOption: .prepareTime)
        numPadViewModel.add(number: .five)
        numPadViewModel.add(number: .seven)
        numPadViewModel.add(number: .nine)
        XCTAssertEqual(numPadViewModel.value, "579")
        // When the onDone
        numPadViewModel.onDone(updateItem: item)
        // Item value is 0
        XCTAssertEqual(item.itemValue, "579")
    }
    
}
