//
//  HogeViewModel.swift
//  SampleKeyboard CustomBar
//
//  Created by Johnny Toda on 2024/11/04.
//

import Foundation
import SwiftUI

@Observable
final class HogeViewModel {
    var value1: String = ""
    var value2: String = ""
    var value3: String = ""
    
// TODO: 以下のような感じでViewModel側にInput処理を持たせたい感
//    func tapKeyboardCustomBarPreviousButton() {
//        moveToPreviousField()
//    }
//    
//    func tapKeyboardCustomBarNextButton() {
//        moveToNextField()
//    }
}

//private extension HogeViewModel {
//    func moveToPreviousField() {
//        switch focusedField {
//        case .field1:
//            focusedField = .field3
//        case .field2:
//            focusedField = .field1
//        case .field3:
//            focusedField = .field2
//        default:
//            focusedField = nil
//        }
//    }
//
//    func moveToNextField() {
//        switch focusedField {
//        case .field1:
//            focusedField = .field2
//        case .field2:
//            focusedField = .field3
//        case .field3:
//            focusedField = .field1
//        default:
//            focusedField = nil
//        }
//    }
//}
