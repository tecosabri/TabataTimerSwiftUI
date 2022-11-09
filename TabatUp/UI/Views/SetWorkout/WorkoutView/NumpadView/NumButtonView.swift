//
//  NumButtonView.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 9/11/22.
//

import SwiftUI

struct NumButtonView: View {
    
    let size: CGFloat = 60
    var number: Int
    
    var body: some View {
        Text("\(number)")
            .bold()
            .font(.title)
            .overlay(
                Rectangle()
                    .stroke()
                    .frame(width: size, height: size)
            )
            .frame(width: size, height: size)
    }
}

struct NumButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NumButtonView(number: 8)
    }
}
