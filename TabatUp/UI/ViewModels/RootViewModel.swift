//
//  RootViewModel.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 27/10/22.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
    
    // MARK: - Properties
    /// The application's status.
    @Published var status: Status = .none
}
