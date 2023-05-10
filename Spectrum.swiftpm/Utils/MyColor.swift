//
//  MyColor.swift
//  Spectrum
//
//  Created by Daniel Aprillio on 17/04/23.
//

import Foundation
import SwiftUI

private let customBlue1: Color = rgbToColor(red: 26, green: 167, blue: 236)
private let customBlue2: Color = rgbToColor(red: 77, green: 147, blue: 229)

private let customYellow1: Color = rgbToColor(red: 241, green: 255, blue: 0)
private let customYellow2: Color = rgbToColor(red: 255, green: 225, blue: 62)

private let customRed1: Color = rgbToColor(red: 226, green: 8, blue: 8)
private let customRed2: Color = rgbToColor(red: 212, green: 0, blue: 87)

private let customWhite1: Color = rgbToColor(red: 250, green: 248, blue: 255)
private let customWhite2: Color = rgbToColor(red: 246, green: 246, blue: 246)

private let customBlack1: Color = rgbToColor(red: 40, green: 42, blue: 46)
private let customBlack2: Color = rgbToColor(red: 5, green: 5, blue: 5)

private let customGreen1: Color = rgbToColor(red: 0, green: 244, blue: 63)
private let customGreen2: Color = rgbToColor(red: 0, green: 213, blue: 126)

private let customPurple1: Color = rgbToColor(red: 126, green: 0, blue: 230)
private let customPurple2: Color = rgbToColor(red: 101, green: 15, blue: 172)

private let customOrange1: Color = rgbToColor(red: 255, green: 155, blue: 84)
private let customOrange2: Color = rgbToColor(red: 255, green: 146, blue: 0)

private let customPink1: Color = rgbToColor(red: 255, green: 192, blue: 203)
private let customPink2: Color = rgbToColor(red: 254, green: 127, blue: 205)

private let customGrey1: Color = rgbToColor(red: 181, green: 181, blue: 181)
private let customGrey2: Color = rgbToColor(red: 128, green: 128, blue: 128)

private let customBrown1: Color = rgbToColor(red: 185, green: 135, blue: 100)
private let customBrown2: Color = rgbToColor(red: 150, green: 75, blue: 0)

func rgbToColor(red: Double, green: Double, blue: Double) -> Color {
    return Color(red: red / 255, green: green / 255, blue: blue / 255)
}

struct MyColor{
    static let blue = LinearGradient(
        gradient: Gradient(
            colors: [customBlue1,customBlue2]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    static let yellow = LinearGradient(
        gradient: Gradient(
            colors: [customYellow1,customYellow2]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    static let red = LinearGradient(
        gradient: Gradient(
            colors: [customRed1,customRed2]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    static let white = LinearGradient(
        gradient: Gradient(
            colors: [customWhite1,customWhite2]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    static let black = LinearGradient(
        gradient: Gradient(
            colors: [customBlack1,customBlack2]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    static let green = LinearGradient(
        gradient: Gradient(
            colors: [customGreen1,customGreen2]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    static let purple = LinearGradient(
        gradient: Gradient(
            colors: [customPurple1,customPurple2]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    static let orange = LinearGradient(
        gradient: Gradient(
            colors: [customOrange1,customOrange2]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    static let pink = LinearGradient(
        gradient: Gradient(
            colors: [customPink1,customPink2]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    static let grey = LinearGradient(
        gradient: Gradient(
            colors: [customGrey1,customGrey2]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    static let brown = LinearGradient(
        gradient: Gradient(
            colors: [customBrown1,customBrown2]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}
