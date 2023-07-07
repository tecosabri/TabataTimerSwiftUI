//
//  CustomButton.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 10/11/22.
//
import SwiftUI

struct CustomButton: View {
    
    let size: CGFloat = Constants.buttonSize
    var numpadSymbol: NumPadSymbol
    
    var body: some View {
        switch numpadSymbol {
        case .deleteArrow:
        ZStack {
            Circle()
                .fill(Color.red)
                .frame(width: size, height: size)

            Image(systemName: "delete.left")
                .resizable()
                .scaledToFit()
                .frame(width: size / 2, height: size / 2)
                .foregroundColor(Color.white)
        }

            
        case .done:
            ZStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: size, height: size)

                Image(systemName: "checkmark.seal")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size / 2, height: size / 2)
                    .foregroundColor(Color.white)
            }
        }

    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(numpadSymbol: .deleteArrow)
    }
}
