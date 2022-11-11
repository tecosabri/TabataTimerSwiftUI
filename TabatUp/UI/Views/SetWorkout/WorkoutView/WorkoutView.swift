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
            if !setWorkoutViewModel.currentlyModifiedItemIsTapped() {
                Text("Customize your workout!")
                    .bold()
                    .font(.title)
            }
            ZStack (alignment: .center){
                // Set the title on the center
                TextField("Workout title", text: $setWorkoutViewModel.title, axis: .vertical)
                    .lineLimit(3)
                    .frame(width: UIScreen.screenWidth / 2 * 0.7)
                    .bold()
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .disableAutocorrection(true)
                    .onChange(of: setWorkoutViewModel.title) { newValue in
                        guard let lastChar = newValue.last else { return }
                        if lastChar == "\n" {
                            setWorkoutViewModel.title.removeLast()
                            hideKeyboard()
                        }
                    }
                    

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
                        Text(setWorkoutViewModel.currentlyModifiedItem?.option.rawValue ?? "")
                            .bold()
                            .font(.caption)
                        Text(setWorkoutViewModel.currentlyModifiedItem?.itemValue ?? "")
                            .bold()
                            .font(.title)
                    }
                }
            }
            if(setWorkoutViewModel.currentlyModifiedItemIsTapped()) {
                NumPadView(setWorkoutItem: setWorkoutViewModel.currentlyModifiedItem!, numPadViewModel: NumPadViewModel(setWorkoutOption: setWorkoutViewModel.currentlyModifiedItem!.option)) // ! as currentlyModifiedItemIsTapped checks null
                    .frame(width: UIScreen.screenWidth)
                    .padding(.bottom, 40)
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(setWorkoutViewModel: PreviewWorkoutViewModels.defaultWorkout())
    }
}



