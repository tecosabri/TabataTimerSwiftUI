//
//  SetWorkoutItemView.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 28/10/22.
//

import SwiftUI

struct SetWorkoutItemView: View {
    
    @ObservedObject var setWorkoutItem: SetWorkoutItemViewModel
    let size = 80.0
    
    var body: some View {
        ZStack {
            // Circle to be coloured if the setworkout item value is modified
            if setWorkoutItem.isSet {
                Circle()
                    .fill(.red)
                    .frame(width: size, height: size)
                    .zIndex(0)
            }
            // Info of the setworkout item and stroke of the circle
            VStack {
                Text(setWorkoutItem.option.rawValue)
                    .font(.caption2)
                    .bold()
                    .fixedSize()
                
                Spacer()
                Text(setWorkoutItem.itemValue)
                    .bold()
            }
            .padding()
            .overlay(
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(width: size, height: size)
            )
            .frame(width: size, height: size)
            .zIndex(1)
        }
        .onTapGesture {
            if setWorkoutItem.option == .cycles {
                setWorkoutItem.itemValue = "100"
            } else {
                setWorkoutItem.itemValue = "12"
            }
        }
    }
}

struct SetWorkoutItemView_Previews: PreviewProvider {
    static var previews: some View {
        let workout = PreviewWorkoutViewModels.defaultWorkout()
        SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .restBetweenCycles, fromSetWorkoutViewModel: workout))
            .previewLayout(.sizeThatFits)
            .frame(width: 60.0, height: 60.0)
    }
}

