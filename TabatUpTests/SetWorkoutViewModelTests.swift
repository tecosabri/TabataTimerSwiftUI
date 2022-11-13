//
//  SetWorkoutViewModelTests.swift
//  TabatUpTests
//
//  Created by Ismael Sabri Pérez on 9/11/22.
//

import XCTest
@testable import TabatUp

final class SetWorkoutViewModelTests: XCTestCase {

    // MARK: - init(withWorkoutModel workout: SetWorkoutModel)
    func test_initWithWorkoutModel_whenInit_propertiesAreSet() {
        // Given a workout model with default values
        let setWorkoutViewModel: SetWorkoutViewModel
        // When initialized
        setWorkoutViewModel = SetWorkoutViewModel.fixture(title: "Title", prepareTime: 1, workTime: 1, restBetweenCycles: 1, cycles: 1, sets: 1, restBetweenSets: 1)
        // Then the properties are initialized
        XCTAssertEqual(setWorkoutViewModel.title, "Title")
        XCTAssertEqual(setWorkoutViewModel.prepareTime, "1")
        XCTAssertEqual(setWorkoutViewModel.workTime, "1")
        XCTAssertEqual(setWorkoutViewModel.restBetweenCycles, "1")
        XCTAssertEqual(setWorkoutViewModel.cycles, "1")
        XCTAssertEqual(setWorkoutViewModel.sets, "1")
        XCTAssertEqual(setWorkoutViewModel.restBetweenSets, "1")
    }
    
    // MARK: - populateItems()
    func test_initWithWorkoutModel_whenInit_itemsArePopulated() {
        // Given a workout model with default values
        let setWorkoutViewModel: SetWorkoutViewModel
        // When initialized
        setWorkoutViewModel = SetWorkoutViewModel.fixture(title: "Title", prepareTime: 1, workTime: 1, restBetweenCycles: 1, cycles: 1, sets: 1, restBetweenSets: 1)
        // Then the properties are initialized
        XCTAssertEqual(setWorkoutViewModel.items[.prepareTime]?.itemValue, "1")
        XCTAssertEqual(setWorkoutViewModel.items[.workTime]?.itemValue, "1")
        XCTAssertEqual(setWorkoutViewModel.items[.restBetweenCycles]?.itemValue, "1")
        XCTAssertEqual(setWorkoutViewModel.items[.cycles]?.itemValue, "1")
        XCTAssertEqual(setWorkoutViewModel.items[.sets]?.itemValue, "1")
        XCTAssertEqual(setWorkoutViewModel.items[.restBetweenSets]?.itemValue, "1")
    }
    
    // MARK: - Getter of variable currentlyModifiedItem
    func test_currentlyModifiedItem_whenGetAndNoItemHasBeenModified_returnsNil() {
        // Given a set workout view model with default values
        let setWorkoutViewModel = SetWorkoutViewModel.fixture(title: "Title", prepareTime: 1, workTime: 1, restBetweenCycles: 1, cycles: 1, sets: 1, restBetweenSets: 1)
        // When
        let modifiedItem = setWorkoutViewModel.currentlyModifiedItem
        // Then
        XCTAssertNil(modifiedItem)
    }
    
    func test_getCurrentlyModifiedItem_whenCalledWhenAnItemHasBeenModified_returnsItem() {
        // Given a set workout view model with default values
        let setWorkoutViewModel = SetWorkoutViewModel.fixture(title: "Title", prepareTime: 1, workTime: 1, restBetweenCycles: 1, cycles: 1, sets: 1, restBetweenSets: 1)
        // When
        var modifiedItem = setWorkoutViewModel.currentlyModifiedItem
        XCTAssertNil(modifiedItem)
        setWorkoutViewModel.items[.prepareTime]?.itemValue = "5"
        modifiedItem = setWorkoutViewModel.currentlyModifiedItem
        // Then
        XCTAssertNotNil(modifiedItem)
        XCTAssertEqual(modifiedItem?.itemValue, "5")
    }
    
    // MARK: - currentlyModifiedItemIsTapped()
    func test_currentlyModifiedItemIsTapped_whenNoTapOnCurrentlyModifiedItem_returnsFalse() {
        // Given a currently modified set but not tapped
        let setWorkoutViewModel = SetWorkoutViewModel.fixture(title: "Title", prepareTime: 1, workTime: 1, restBetweenCycles: 1, cycles: 1, sets: 1, restBetweenSets: 1)
        setWorkoutViewModel.items[.prepareTime]?.itemValue = "5"
        // When
        let isTapped = setWorkoutViewModel.currentlyModifiedItemIsTapped()
        // Then
        XCTAssertFalse(isTapped)
    }
    
    func test_currentlyModifiedItemIsTapped_whenTapOnCurrentlyModifiedItem_returnsTrue() {
        // Given a currently modified set but not tapped
        let setWorkoutViewModel = SetWorkoutViewModel.fixture(title: "Title", prepareTime: 1, workTime: 1, restBetweenCycles: 1, cycles: 1, sets: 1, restBetweenSets: 1)
        setWorkoutViewModel.items[.prepareTime]?.itemValue = "5"
        // When
        setWorkoutViewModel.currentlyModifiedItem?.onTappedOnce()
        let isTapped = setWorkoutViewModel.currentlyModifiedItemIsTapped()
        // Then
        XCTAssertTrue(isTapped)
    }
    
    // MARK: - manageSettingTitle(withOldValue:)
    func test_manageSettingTitleWithOldValue_whenTitleIsShorterThan25Chars_titleGetsModified() {
        // Given a set workout view model with default title value
        let setWorkoutViewModel = SetWorkoutViewModel.fixture(title: "Default")
        XCTAssertEqual(setWorkoutViewModel.title, "Default")
        let oldValue = "Defaul"
        // When called manage setting title
        setWorkoutViewModel.manageSettingTitle(withOldValue: oldValue)
        // Then nothing happens
        XCTAssertEqual(setWorkoutViewModel.title, "Default")
    }
    
    func test_manageSettingTitleWithOldValue_whenTitleGetsLongerThan25Chars_titleEqualsOldValue() {
        // Given a set workout view model with default title value
        let setWorkoutViewModel = SetWorkoutViewModel.fixture(title: "Thistitleislongerthan25characterslong")
        XCTAssertEqual(setWorkoutViewModel.title, "Thistitleislongerthan25characterslong")
        let oldValue = "oldvalue"
        // When called manage setting title
        setWorkoutViewModel.manageSettingTitle(withOldValue: oldValue)
        // Then nothing happens
        XCTAssertEqual(setWorkoutViewModel.title, oldValue)
    }
    
    func test_manageSettingTitleWithOldValue_whenTitleIsShorterThan25CharsButGetsEndedWithNewLine_titleGetsModified() {
        // Given a set workout view model with default title value
        let title = """
                        TitleShorterThan25
                        
                        """
        let setWorkoutViewModel = SetWorkoutViewModel.fixture(title: title)
        XCTAssertEqual(setWorkoutViewModel.title, "TitleShorterThan25\n")
        let oldValue = "TitleShorterThan25"
        // When called manage setting title
        setWorkoutViewModel.manageSettingTitle(withOldValue: oldValue)
        // Then nothing happens
        XCTAssertEqual(setWorkoutViewModel.title, "TitleShorterThan25\n")
    }


}
