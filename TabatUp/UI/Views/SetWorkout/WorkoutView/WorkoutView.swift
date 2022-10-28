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
            Divider()
            Text(setWorkoutViewModel.title)
            Divider()
            ScrollView(.horizontal) {
                HStack (spacing: 20){
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .prepareTime, fromSetWorkoutViewModel: setWorkoutViewModel))
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .workTime, fromSetWorkoutViewModel: setWorkoutViewModel))
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .restBetweenCycles, fromSetWorkoutViewModel: setWorkoutViewModel))
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .cycles, fromSetWorkoutViewModel: setWorkoutViewModel))
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .restBetweenSets, fromSetWorkoutViewModel: setWorkoutViewModel))
                    SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .sets, fromSetWorkoutViewModel: setWorkoutViewModel))
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
