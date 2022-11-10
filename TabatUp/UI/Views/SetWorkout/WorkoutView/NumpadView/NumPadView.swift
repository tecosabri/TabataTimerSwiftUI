//
//  NumPadView.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 9/11/22.
//

import SwiftUI

struct NumPadView: View {
    
    @ObservedObject var setWorkoutItem: SetWorkoutItemViewModel
    @ObservedObject var numPadViewModel: NumPadViewModel
    
    init(setWorkoutItem: SetWorkoutItemViewModel, numPadViewModel: NumPadViewModel) {
        self.setWorkoutItem = setWorkoutItem
        self.numPadViewModel = NumPadViewModel(setWorkoutOption: setWorkoutItem.option)
    }
    
    var body: some View {
        
        Grid (alignment: .center, horizontalSpacing: 10, verticalSpacing: 10) {
            Text("\(setWorkoutItem.option.rawValue): \(numPadViewModel.value)")
                .bold()
                .font(.title2)
                
            GridRow {
                NumButtonView(number: .one).onTapGesture { numPadViewModel.add(number: .one) }
                NumButtonView(number: .two).onTapGesture { numPadViewModel.add(number: .two) }
                NumButtonView(number: .three).onTapGesture { numPadViewModel.add(number: .three) }
                NumButtonView(number: .zero).onTapGesture { numPadViewModel.add(number: .zero) }
            }
            GridRow {
                NumButtonView(number: .four).onTapGesture { numPadViewModel.add(number: .four) }
                NumButtonView(number: .five).onTapGesture { numPadViewModel.add(number: .five) }
                NumButtonView(number: .six).onTapGesture { numPadViewModel.add(number: .six) }
                CustomButton(numpadSymbol: .deleteArrow)
            }
            GridRow {
                NumButtonView(number: .seven).onTapGesture { numPadViewModel.add(number: .seven) }
                NumButtonView(number: .eight).onTapGesture { numPadViewModel.add(number: .eight) }
                NumButtonView(number: .nine).onTapGesture { numPadViewModel.add(number: .nine) }
                CustomButton(numpadSymbol: .done)
            }
        }
    }
}

struct NumPadView_Previews: PreviewProvider {
    static var previews: some View {
        let workout = PreviewWorkoutViewModels.defaultWorkout()
        let setWorkoutItemViewModel = SetWorkoutItemViewModel(workoutOption: .restBetweenCycles, fromSetWorkoutViewModel: workout)
        let numPadViewModel = NumPadViewModel(setWorkoutOption: setWorkoutItemViewModel.option)
        
        NumPadView(setWorkoutItem: setWorkoutItemViewModel, numPadViewModel: numPadViewModel)
    }
}
