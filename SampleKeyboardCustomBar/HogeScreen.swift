//
//  HogeScreen.swift
//  SampleKeyboard CustomBar
//
//  Created by Johnny Toda on 2024/11/04.
//

import SwiftUI

struct HogeScreen: View {
    @State private var viewModel: HogeViewModel = .init()
    @FocusState private var focusedField: Field?
    
    private enum Field {
        case field1, field2, field3, memoField
    }
    
    var body: some View {
        VStack(spacing: 32) {
            pattern1View
            pattern2View
            Spacer()
        }
        .padding(16)
        .toolbar {
            if focusedField == .memoField {
                pattern2TextFieldKeyboardCustomBar
            } else {
                pattern1TextFieldsKeyboardCustomBar
            }
        }
        .onChange(of: focusedField) { _, newValue in
            guard let newValue else {
                return
            }
            focusedField = newValue
        }
    }
    
    var pattern1View: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("パターン1")
                .fontWeight(.black)
            textFields
        }
    }
    
    var textFields: some View {
        HStack(spacing: 4) {
            TextField("値1", text: $viewModel.value1)
                .focused($focusedField, equals: .field1)
            TextField("値2", text: $viewModel.value2)
                .focused($focusedField, equals: .field2)
            TextField("値3", text: $viewModel.value3)
                .focused($focusedField, equals: .field3)
        }
        .textFieldStyle(.roundedBorder)
        .onChange(of: focusedField) { _, newValue in
            guard let newValue else {
                return
            }
            focusedField = newValue
        }
    }
    
    var pattern2View: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("パターン2")
                .fontWeight(.black)
            TextField("", text: $viewModel.value1)
                .textFieldStyle(.roundedBorder)
                .focused($focusedField, equals: .memoField)
        }
    }
    
    var pattern1TextFieldsKeyboardCustomBar: some ToolbarContent {
        ToolbarItemGroup(placement: .keyboard) {
            HStack(spacing: 4) {
                Button(action: {
                    moveToPreviousField()
                }) {
                    Image(systemName: "chevron.left")
                }
                Button(action: {
                    moveToNextField()
                }) {
                    Image(systemName: "chevron.right")
                }
                Spacer()
                Button(action: {
                    focusedField = nil // キーボードを閉じる
                }) {
                    Text("閉じる")
                }
            }
        }
    }
    
    var pattern2TextFieldKeyboardCustomBar: some ToolbarContent {
        ToolbarItemGroup(placement: .keyboard) {
            Spacer()
            Button(action: {
                focusedField = nil // キーボードを閉じる
            }) {
                Text("閉じる")
            }
        }
    }
}

private extension HogeScreen {
    func moveToPreviousField() {
        switch focusedField {
        case .field1:
            focusedField = .field3
        case .field2:
            focusedField = .field1
        case .field3:
            focusedField = .field2
        default:
            focusedField = nil
        }
    }

    func moveToNextField() {
        switch focusedField {
        case .field1:
            focusedField = .field2
        case .field2:
            focusedField = .field3
        case .field3:
            focusedField = .field1
        default:
            focusedField = nil
        }
    }
}

#Preview {
    HogeScreen()
}
