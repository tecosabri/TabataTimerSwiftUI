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
        // Th
        // Then zero gets removed
        XCTAssertEqual(numPadViewModel.value, "3599")
    }
    
    func test_addNumber_whenAddedMoreThanOneHundredRounds_valueIsNinetyNineRounds() {
        // Given a numpad view model
        let numPadViewModel = NumPadViewModel(setWorkoutOption: .sets)
        XCTAssertEqual(numPadViewModel.value, "")
        // When added 3600 seconds
        numPadViewModel.add(number: .one)
        numPadViewModel.add(number: .zero)
        numPadViewModel.add(number: .zero)
        // Th
        // Then zero gets removed
        XCTAssertEqual(numPadViewModel.value, "99")
    }
    
    // MARK: - deleteNumber
    
}
