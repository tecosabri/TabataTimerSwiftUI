//
//  SetWorkoutView.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 28/10/22.
//

import SwiftUI

struct SetWorkoutView: View {
    
    @StateObject var setWorkoutViewModel: SetWorkoutViewModel
    
    var body: some View {
        VStack {
           WorkoutView(setWorkoutViewModel: setWorkoutViewModel)
        }

    }
}

struct SetWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        SetWorkoutView(setWorkoutViewModel: PreviewWorkoutViewModels.defaultWorkout())
    }
}
