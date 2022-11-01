//
//  WorkoutView.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 28/10/22.
//

import SwiftUI

struct WorkoutView: View {
    
    @ObservedObject var setWorkoutViewModel: SetWorkoutViewModel
    
    var body: some View {
        VStack {
            Text("Customize your workout!")
                .bold()
                .font(.title)
            ZStack {
                // Get the setworkoutmodel
                let setWorkoutViewModel = PreviewWorkoutViewModels.defaultWorkout()
                // Set the title on the center
                Text(setWorkoutViewModel.title)
                // Set a circular layout around the title
                CircularLayoutView(setWorkoutViewModel: setWorkoutViewModel) {
                    // Prepare time
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .prepareTime, fromSetWorkoutViewModel: setWorkoutViewModel))
                    // Work time
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .workTime, fromSetWorkoutViewModel: setWorkoutViewModel))
                    // Sets
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .sets, fromSetWorkoutViewModel: setWorkoutViewModel))
                    // Rest between cycles
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .restBetweenCycles, fromSetWorkoutViewModel: setWorkoutViewModel))
                    // Rest between sets
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .restBetweenSets, fromSetWorkoutViewModel: setWorkoutViewModel))
                    // Cycles
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .cycles, fromSetWorkoutViewModel: setWorkoutViewModel))
                }
            }
            Divider()
            Text(setWorkoutViewModel.title)
            Divider()
            ScrollView(.horizontal) {
                HStack (spacing: 20){
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .prepareTime, fromSetWorkoutViewModel: setWorkoutViewModel))
                    
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .sets, fromSetWorkoutViewModel: setWorkoutViewModel))
                    
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .restBetweenSets, fromSetWorkoutViewModel: setWorkoutViewModel))
                    
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .cycles, fromSetWorkoutViewModel: setWorkoutViewModel))
                    
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .restBetweenCycles, fromSetWorkoutViewModel: setWorkoutViewModel))
                    
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .workTime, fromSetWorkoutViewModel: setWorkoutViewModel))
                }
                .frame(height: 90)
            }
            Divider()
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(setWorkoutViewModel: PreviewWorkoutViewModels.defaultWorkout())
    }
}



