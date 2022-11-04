//
//  SetWorkoutItemViewModelTests.swift
//  TabatUpTests
//
//  Created by Ismael Sabri Pérez on 2/11/22.
//

import XCTest
@testable import TabatUp

final class SetWorkoutItemViewModelTests: XCTestCase {
    
    // MARK: - updateSetWorkoutViewModel()
    func test_updateSetWorkoutViewModel_whenUpdatedValueInItem_SameValueGetsUpdatedInItemWorkoutViewModel() {
        // Given a workout item view model with option prepare time and value 10
        let randomWorkout = SetWorkoutViewModel.fixture(prepareTime: 10)
        let sut = SetWorkoutItemViewModel(workoutOption: .prepareTime, fromSetWorkoutViewModel: randomWorkout)
        XCTAssertEqual(randomWorkout.prepareTime, sut.itemValue)
        // When changed the item value to 20 and updated the view model
        sut.itemValue = "20"
        sut.updateSetWorkoutViewModel()
        // Then the view model prepare time has to be 20 seconds
        XCTAssertEqual(sut.setWorkoutViewModel.prepareTime, "20")
    }
    
    func test_updateSetWorkoutViewModel_whenUpdatedValueInItem_OtherValuesRemainTheSameInItemWorkoutViewModel() {
        // Given a workout item view model with option prepare time and value 10
        let randomWorkout = SetWorkoutViewModel.fixture(prepareTime: 10, workTime: 33)
        let sut = SetWorkoutItemViewModel(workoutOption: .prepareTime, fromSetWorkoutViewModel: randomWorkout)
        XCTAssertEqual(randomWorkout.prepareTime, sut.itemValue)
        // When changed the item value to 20 and updated the view model
        sut.itemValue = "20"
        sut.updateSetWorkoutViewModel()
        // Then the view model prepare time has to be 20 seconds
        XCTAssertEqual(sut.setWorkoutViewModel.workTime, "33")
    }
    
    func test_updateSetWorkoutViewModel_whenUpdatedAllDifferentOptionsInDifferentItems_ThoseValuesGetUpdatedInItemWorkoutViewModel() {
        // Given a workout and items for all its options
        let randomWorkout = SetWorkoutViewModel.fixture(title: "title", prepareTime: 1, workTime: 1, restBetweenCycles: 1, cycles: 1, sets: 1, restBetweenSets: 1)
        let sutTitle = SetWorkoutItemViewModel(workoutOption: .title, fromSetWorkoutViewModel: randomWorkout)
        let sutPrepareTime = SetWorkoutItemViewModel(workoutOption: .prepareTime, fromSetWorkoutViewModel: randomWorkout)
        let sutWorkTime = SetWorkoutItemViewModel(workoutOption: .workTime, fromSetWorkoutViewModel: randomWorkout)
        let sutRestBetweenCycles = SetWorkoutItemViewModel(workoutOption: .restBetweenCycles, fromSetWorkoutViewModel: randomWorkout)
        let sutCycles = SetWorkoutItemViewModel(workoutOption: .cycles, fromSetWorkoutViewModel: randomWorkout)
        let sutSets = SetWorkoutItemViewModel(workoutOption: .sets, fromSetWorkoutViewModel: randomWorkout)
        let sutRestBetweenSets = SetWorkoutItemViewModel(workoutOption: .restBetweenSets, fromSetWorkoutViewModel: randomWorkout)
        // When changed the item values and updated the view model
        sutTitle.itemValue = "title2"
        sutTitle.updateSetWorkoutViewModel()
        sutPrepareTime.itemValue = "2"
        sutPrepareTime.updateSetWorkoutViewModel()
        sutWorkTime.itemValue = "2"
        sutWorkTime.updateSetWorkoutViewModel()
        sutRestBetweenCycles.itemValue = "2"
        sutRestBetweenCycles.updateSetWorkoutViewModel()
        sutCycles.itemValue = "2"
        sutCycles.updateSetWorkoutViewModel()
        sutSets.itemValue = "2"
        sutSets.updateSetWorkoutViewModel()
        sutRestBetweenSets.itemValue = "2"
        sutRestBetweenSets.updateSetWorkoutViewModel()
        // Then the view model prepare time has to be 20 seconds
        XCTAssertEqual(sutTitle.setWorkoutViewModel.title, "title2")
        XCTAssertEqual(sutPrepareTime.setWorkoutViewModel.prepareTime, "2")
        XCTAssertEqual(sutWorkTime.setWorkoutViewModel.workTime, "2")
        XCTAssertEqual(sutRestBetweenCycles.setWorkoutViewModel.restBetweenCycles, "2")
        XCTAssertEqual(sutCycles.setWorkoutViewModel.cycles, "2")
        XCTAssertEqual(sutSets.setWorkoutViewModel.sets, "2")
        XCTAssertEqual(sutRestBetweenSets.setWorkoutViewModel.restBetweenSets, "2")
    }

    // MARK: - onDraggedWith(offSet: CGFloat)
    func test_onDraggedWithOffSet_whenDraggedUpTitleSetsOrCyclesItems_valueRemainsTheSame() {
        // Given a workout with random title, 2 cycles and 2 sets
        let randomWorkout = SetWorkoutViewModel.fixture(title: "RandomTitle", cycles: 2, sets: 2)
        let titleSut = SetWorkoutItemViewModel.fixture(workoutOption: .title, setWorkoutViewModel: randomWorkout)
        let setsSut = SetWorkoutItemViewModel.fixture(workoutOption: .sets, setWorkoutViewModel: randomWorkout)
        let cyclesSut = SetWorkoutItemViewModel.fixture(workoutOption: .cycles, setWorkoutViewModel: randomWorkout)
        titleSut.lastDragValueHeight = 0
        setsSut.lastDragValueHeight = 0
        cyclesSut.lastDragValueHeight = 0
        // When dragged up (height approaches to coordinate 0)
        titleSut.onDraggedWith(offSet: -2)
        setsSut.onDraggedWith(offSet: -2)
        cyclesSut.onDraggedWith(offSet: -2)
        // Then the value gets incremented
        XCTAssertEqual(titleSut.itemValue, "RandomTitle")
        XCTAssertEqual(setsSut.itemValue, "2")
        XCTAssertEqual(cyclesSut.itemValue, "2")
    }
    
    func test_onDraggedWithOffSet_whenDraggedDownTitleSetsOrCyclesItems_valueRemainsTheSame() {
        // Given a workout with random title, 2 cycles and 2 sets
        let randomWorkout = SetWorkoutViewModel.fixture(title: "RandomTitle", cycles: 2, sets: 2)
        let titleSut = SetWorkoutItemViewModel.fixture(workoutOption: .title, setWorkoutViewModel: randomWorkout)
        let setsSut = SetWorkoutItemViewModel.fixture(workoutOption: .sets, setWorkoutViewModel: randomWorkout)
        let cyclesSut = SetWorkoutItemViewModel.fixture(workoutOption: .cycles, setWorkoutViewModel: randomWorkout)
        titleSut.lastDragValueHeight = 2
        setsSut.lastDragValueHeight = 2
        cyclesSut.lastDragValueHeight = 2
        // When dragged up (height approaches to coordinate 0)
        titleSut.onDraggedWith(offSet: 4)
        setsSut.onDraggedWith(offSet: 4)
        cyclesSut.onDraggedWith(offSet: 4)
        // Then the value gets incremented
        XCTAssertEqual(titleSut.itemValue, "RandomTitle")
        XCTAssertEqual(setsSut.itemValue, "2")
        XCTAssertEqual(cyclesSut.itemValue, "2")
    }
    
    func test_onDraggedWithOffSet_whenDraggedUp_valueGetsIncremented() {
        // Given a prepare time item with value 30 that has not been dragged
        let thirtySecondsPrepareTimeWorkout = SetWorkoutViewModel.fixture(prepareTime: 30)
        let sut = SetWorkoutItemViewModel.fixture(workoutOption: .prepareTime, setWorkoutViewModel: thirtySecondsPrepareTimeWorkout)
        sut.lastDragValueHeight = 0
        // When dragged up (height approaches to coordinate 0)
        sut.onDraggedWith(offSet: -2)
        // Then the value gets incremented
        XCTAssertEqual(sut.itemValue, "31")
    }
    
    func test_onDraggedWithOffSet_whenDraggedUpDown_valueRemainsTheSame() {
        // Given a prepare time item with value 30 that has been dragged to heigth -1
        let thirtySecondsPrepareTimeWorkout = SetWorkoutViewModel.fixture(prepareTime: 30)
        let sut = SetWorkoutItemViewModel.fixture(workoutOption: .prepareTime, setWorkoutViewModel: thirtySecondsPrepareTimeWorkout)
        sut.lastDragValueHeight = -2
        // When first dragged up to -2 and then dragged down to -1
        sut.onDraggedWith(offSet: -4)
        XCTAssertEqual(sut.itemValue, "31")
        sut.onDraggedWith(offSet: -2)
        // Then the value remains the same as it started
        XCTAssertEqual(sut.itemValue, "30")
    }
    
    func test_onDraggedWithOffSet_whenDraggedDown_valueGetsDecremented() {
        // Given a prepare time item with value 30 that has not been dragged
        let thirtySecondsPrepareTimeWorkout = SetWorkoutViewModel.fixture(prepareTime: 30)
        let sut = SetWorkoutItemViewModel.fixture(workoutOption: .prepareTime, setWorkoutViewModel: thirtySecondsPrepareTimeWorkout)
        sut.lastDragValueHeight = 0
        // When dragged down (height goes downscreen)
        sut.onDraggedWith(offSet: 2)
        // Then the value gets decremented
        XCTAssertEqual(sut.itemValue, "29")
    }
    
    func test_onDraggedWithOffSet_whenDraggedDownUp_valueRemainsTheSame() {
        // Given a prepare time item with value 30 that has not been dragged
        let thirtySecondsPrepareTimeWorkout = SetWorkoutViewModel.fixture(prepareTime: 30)
        let sut = SetWorkoutItemViewModel.fixture(workoutOption: .prepareTime, setWorkoutViewModel: thirtySecondsPrepareTimeWorkout)
        sut.lastDragValueHeight = 2
        // When first dragged down to 2 and then up to 1
        sut.onDraggedWith(offSet: 4)
        XCTAssertEqual(sut.itemValue, "29")
        sut.onDraggedWith(offSet: 2)
        // Then the value remains the same as it started
        XCTAssertEqual(sut.itemValue, "30")
    }

    // MARK: - onDragEndedWith(offSet: CGFloat)
    func test_onDragEndedWithOffset_whenDraggedUpCyclesOrSets_valueGetsIncremented() {
        // Given a cycles item with value 5
        let fiveCyclesWorkout = SetWorkoutViewModel.fixture(cycles: 5)
        let sut = SetWorkoutItemViewModel.fixture(workoutOption: .cycles, setWorkoutViewModel: fiveCyclesWorkout)
        // When dragged up (the offset is negative)
        sut.onDragEndedWith(offSet: -5)
        // Then the value gets incremented
        XCTAssertEqual(sut.itemValue, "6")
    }
    
    func test_onDragEndedWithOffset_whenDraggedDownCyclesOrSets_valueGetsDecremented() {
        // Given a cycles item with value 5
        let fiveCyclesWorkout = SetWorkoutViewModel.fixture(cycles: 5)
        let sut = SetWorkoutItemViewModel.fixture(workoutOption: .cycles, setWorkoutViewModel: fiveCyclesWorkout)
        // When dragged up (the offset is negative)
        sut.onDragEndedWith(offSet: 5)
        // Then the value gets incremented
        XCTAssertEqual(sut.itemValue, "4")
    }
    
    func test_onDragEndedWithOffset_whenDraggedUpWorkTimeItem_valueRemainsTheSame() {
        // Given a work time item with 30 seconds time
        let thirtySecondsWorkTimeWorkout = SetWorkoutViewModel.fixture(workTime: 30)
        let sut = SetWorkoutItemViewModel.fixture(workoutOption: .workTime, setWorkoutViewModel: thirtySecondsWorkTimeWorkout)
        // When dragged up (the offset is negative)
        sut.onDragEndedWith(offSet: -5)
        // Then the value remains the same
        XCTAssertEqual(sut.itemValue, "30")
    }
    
    func test_onDragEndedWithOffset_whenDraggedDownWorkTimeItem_valueRemainsTheSame() {
        // Given a work time item with 30 seconds time
        let thirtySecondsWorkTimeWorkout = SetWorkoutViewModel.fixture(workTime: 30)
        let sut = SetWorkoutItemViewModel.fixture(workoutOption: .workTime, setWorkoutViewModel: thirtySecondsWorkTimeWorkout)
        // When dragged down (the offset is positive)
        sut.onDragEndedWith(offSet: 5)
        // Then the value remains the same
        XCTAssertEqual(sut.itemValue, "30")
    }

}
