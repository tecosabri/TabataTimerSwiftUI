//
//  WorkoutView.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 28/10/22.
//

import SwiftUI

struct WorkoutView: View {
    
    @ObservedObject var setWorkoutViewModel: SetWorkoutViewModel
    @State private var showView = false
    
    var body: some View {
        VStack {
            Text("Customize your workout!")
                .bold()
                .font(.title)
            ZStack {
                // Set the title on the center
                Text(setWorkoutViewModel.title)
                    .bold()
                    .font(.title2)
                // Set a circular layout around the title
                CircularLayoutView(setWorkoutViewModel: setWorkoutViewModel) {
                    // Prepare time
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .prepareTime, fromSetWorkoutViewModel: setWorkoutViewModel))
                    
                    // Sets
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .sets, fromSetWorkoutViewModel: setWorkoutViewModel))
                    
                    // Cycle rest
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .restBetweenCycles, fromSetWorkoutViewModel: setWorkoutViewModel))
                    
                    // Worktime
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .workTime, fromSetWorkoutViewModel: setWorkoutViewModel))
                    
                    // Cycles
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .cycles, fromSetWorkoutViewModel: setWorkoutViewModel))
                    
                    // Set rest
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .restBetweenSets, fromSetWorkoutViewModel: setWorkoutViewModel))
                    
                    // Currently modified value appears when any of the items is modified
                    FadeOutVStack(setWorkoutViewModel: setWorkoutViewModel) {
                        Text(setWorkoutViewModel.currentlyModifiedValue?.first?.key.rawValue ?? "")
                            .bold()
                            .font(.caption)
                        Text(setWorkoutViewModel.currentlyModifiedValue?.values.first ?? "")
                            .bold()
                            .font(.title)
                    }
                }
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(setWorkoutViewModel: PreviewWorkoutViewModels.defaultWorkout())
    }
}



