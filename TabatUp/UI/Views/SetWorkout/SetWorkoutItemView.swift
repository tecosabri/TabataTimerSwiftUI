//
//  SetWorkoutItemView.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 28/10/22.
//

import SwiftUI

struct SetWorkoutItemView: View {
    
    let setWorkoutItem: SetWorkoutItemViewModel
    
    var body: some View {
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
        .overlay(Circle().stroke(lineWidth: 2))
        .frame(width: 60.0, height: 60.0)
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

