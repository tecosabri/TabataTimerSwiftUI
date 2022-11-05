//
//  CurrentlyModifiedItemValueView.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 5/11/22.
//

import SwiftUI

struct FadeOutVStack <Content: View>: View {
    var content: Content
    var setWorkoutViewModel: SetWorkoutViewModel
    @State private var showView = false
    
    var body: some View {
        VStack{
            content
                .opacity(showView ? 1 : 0)
                .onChange(of: setWorkoutViewModel.currentlyModifiedValue) { _ in
                    self.showView = true
                }
                .onChange(of: showView) { _ in
                    withAnimation (.easeIn(duration: 2)) {
                        showView = false
                    }
                }
        }
        
    }
    
    init(setWorkoutViewModel: SetWorkoutViewModel, @ViewBuilder content: () -> Content) {
        self.setWorkoutViewModel = setWorkoutViewModel
        self.content = content()
    }
}
