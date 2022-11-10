//
//  CustomButton.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 10/11/22.
//
import SwiftUI

struct CustomButton: View {
    
    let size: CGFloat = 60
    var numpadSymbol: NumPadSymbol
    
    var body: some View {
        switch numpadSymbol {
        case .deleteArrow:
            Image(systemName: "delete.left")
                .font(.title)
                .overlay(
                    Rectangle()
                        .stroke()
                        .frame(width: size, height: size)
                )
                .frame(width: size, height: size)
        case .done:
            Image(systemName: "checkmark.seal")
                .font(.title)
                .overlay(
                    Rectangle()
                        .stroke()
                        .frame(width: size, height: size)
                )
                .frame(width: size, height: size)
        }

    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(numpadSymbol: .deleteArrow)
    }
}
