//
//  NumPadView.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 9/11/22.
//

import SwiftUI

struct NumPadView: View {
    
    @ObservedObject var setWorkoutItem: SetWorkoutItemViewModel
    
    var body: some View {
        
        Grid (alignment: .center, horizontalSpacing: 10, verticalSpacing: 10) {
            Text("\(setWorkoutItem.option.rawValue): \(setWorkoutItem.itemValue)")
                .bold()
                .font(.title)
                
            GridRow {
                NumButtonView(number: 1)
                NumButtonView(number: 2)
                NumButtonView(number: 3)
                NumButtonView(number: 0)
            }
            GridRow {
                NumButtonView(number: 4)
                NumButtonView(number: 5)
                NumButtonView(number: 6)
                CustomButton(numpadSymbol: .deleteArrow)
            }
            GridRow {
                NumButtonView(number: 7)
                NumButtonView(number: 8)
                NumButtonView(number: 9)
                CustomButton(numpadSymbol: .done)
            }
        }
    }
}

struct NumPadView_Previews: PreviewProvider {
    static var previews: some View {
        let workout = PreviewWorkoutViewModels.defaultWorkout()
        NumPadView(setWorkoutItem: SetWorkoutItemViewModel(workoutOption: .restBetweenCycles, fromSetWorkoutViewModel: workout))
    }
}
