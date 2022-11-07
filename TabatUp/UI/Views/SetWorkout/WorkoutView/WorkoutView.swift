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
                    // Prepare time. Force unwrap as items are already set
                    SetWorkoutItemView(setWorkoutItem: setWorkoutViewModel.items[.prepareTime]!)
                    
                    // Sets
                    SetWorkoutItemView(setWorkoutItem: setWorkoutViewModel.items[.sets]!)
                    
                    // Cycle rest
                    SetWorkoutItemView(setWorkoutItem: setWorkoutViewModel.items[.restBetweenCycles]!)
                    
                    // Worktime
                    SetWorkoutItemView(setWorkoutItem: setWorkoutViewModel.items[.workTime]!)
                    
                    // Cycles
                    SetWorkoutItemView(setWorkoutItem: setWorkoutViewModel.items[.cycles]!)
                    
                    // Set rest
                    SetWorkoutItemView(setWorkoutItem: setWorkoutViewModel.items[.restBetweenSets]!)
                    
                    // Currently modified value appears when any of the items is modified
                    FadeOutVStack(setWorkoutViewModel: setWorkoutViewModel) {
                        Text(setWorkoutViewModel.currentlyModifiedItem?.first?.key.rawValue ?? "")
                            .bold()
                            .font(.caption)
                        Text(setWorkoutViewModel.currentlyModifiedItem?.values.first ?? "")
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


