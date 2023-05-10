//
//  AlertToast.swift
//  Spectrum
//
//  Created by Daniel Aprillio on 18/04/23.
//

import SwiftUI

struct AlertToast: View {
    
    @Binding var isCorrect: Bool
    
    var body: some View {
        VStack{
            if isCorrect{
                VStack{
                    Image(systemName: "face.smiling")
                        .font(.system(size: 96))
                    Spacer().frame(height: 16)
                    Text("Correct!")
                        .font(.system(size: 42, weight: .bold))
                }
                .frame(width: 280, height: 280)
                .foregroundColor(Color.green)
                .background(Color.white.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: Color.white.opacity(0.8), radius: 8, x: 2, y: 2)
                .padding()
            } else {
                VStack{
                    Image(systemName: "x.circle")
                        .font(.system(size: 96))
                    Spacer().frame(height: 16)
                    Text("Wrong!")
                        .font(.system(size: 42, weight: .bold))
                }
                .frame(width: 280, height: 280)
                .foregroundColor(Color.red)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 2, y: 2)
                .padding()
            }
            
        }
    }
}

struct AlertToast_Previews: PreviewProvider {
    static var previews: some View {
        AlertToast(isCorrect: .constant(false))
    }
}
