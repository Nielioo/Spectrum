//
//  AnswerButton.swift
//  Spectrum
//
//  Created by Daniel Aprillio on 14/04/23.
//

import SwiftUI

struct AnswerButton: View {
    var colorStr: String = "Brown"
    
    var body: some View {
        let color: LinearGradient = generateColor(colorStr: colorStr)
        let fontColor: Color = generateFontColor(colorStr: colorStr)
        
        Text("\(colorStr)")
                .frame(width: 320, height: 240)
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(fontColor)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
        
    }
    
    func generateColor(colorStr: String) -> LinearGradient{
        if(colorStr == "Blue"){
            return MyColor.blue
        } else if(colorStr == "Yellow") {
            return MyColor.yellow
        } else if(colorStr == "Red") {
            return MyColor.red
        }else if(colorStr == "White") {
            return MyColor.white
        }else if(colorStr == "Black") {
            return MyColor.black
        }else if(colorStr == "Green") {
            return MyColor.green
        }else if(colorStr == "Purple") {
            return MyColor.purple
        }else if(colorStr == "Orange") {
            return MyColor.orange
        }else if(colorStr == "Pink") {
            return MyColor.pink
        }else if(colorStr == "Grey") {
            return MyColor.grey
        }else if(colorStr == "Brown") {
            return MyColor.brown
        }else {
            return MyColor.black
        }
    }
    
    func generateFontColor(colorStr: String) -> Color{
        if(colorStr == "Yellow" || colorStr == "White" || colorStr == "Pink"){
            return Color.black
        } else {
            return Color.white
        }
    }
    
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        AnswerButton(colorStr: "Brown")
    }
}
