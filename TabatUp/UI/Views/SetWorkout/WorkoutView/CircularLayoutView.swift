//
//  WorkoutCircleView.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 31/10/22.
//

import SwiftUI

struct CircularLayoutView : Layout {
    
    var radius: CGFloat = (UIScreen.screenWidth * 0.7) / 2.0
    @ObservedObject var setWorkoutViewModel: SetWorkoutViewModel
    
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for (index, subview) in subviews.enumerated() {
            // Find a vector with an appropriate size and rotation.
            var point = CGPoint(x: 0, y: -radius)
                .applying(CGAffineTransform(
                    rotationAngle: 60 * Double(index)))
            
            // Shift the vector to the middle of the region.
            point.x += bounds.midX
            point.y += bounds.midY
            
            // Place the subview.
            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
}

struct CircularLayout_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            // Get the setworkoutmodel
            let setWorkoutViewModel = PreviewWorkoutViewModels.defaultWorkout()
            // Set the title on the center
            Text(setWorkoutViewModel.title)
            // Set a circular layout around the title
            CircularLayoutView(setWorkoutViewModel: setWorkoutViewModel) {
                SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .prepareTime, fromSetWorkoutViewModel: setWorkoutViewModel))
                
                SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .workTime, fromSetWorkoutViewModel: setWorkoutViewModel))
                
                SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .sets, fromSetWorkoutViewModel: setWorkoutViewModel))
                
                SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .restBetweenCycles, fromSetWorkoutViewModel: setWorkoutViewModel))
                
                SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .restBetweenSets, fromSetWorkoutViewModel: setWorkoutViewModel))
                
                SetWorkoutItemView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .cycles, fromSetWorkoutViewModel: setWorkoutViewModel))
            }
        }
    }
}
