//
//  ViewExtension.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 10/11/22.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

