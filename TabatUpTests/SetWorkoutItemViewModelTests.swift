//
//  SetWorkoutItemViewModelTests.swift
//  TabatUpTests
//
//  Created by Ismael Sabri Pérez on 2/11/22.
//

import XCTest
@testable import TabatUp

final class SetWorkoutItemViewModelTests: XCTestCase {

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

}
