//
//  RootView.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 27/10/22.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        switch rootViewModel.status {
        case .none:
            HomeView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(RootViewModel())
    }
}
