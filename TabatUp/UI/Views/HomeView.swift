//
//  HomeView.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 24/10/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            TimerView()
                .tabItem {
                    Label("Timer", systemImage: "clock")
                }
            SetWorkoutView()
                .tabItem {
                    Label("Set workout", systemImage: "dumbbell")
                }
            LoadWorkoutView()
                .tabItem {
                    Label("Load workout", systemImage: "brain")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
