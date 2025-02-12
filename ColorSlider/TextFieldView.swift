//
//  FieldView.swift
//  ColorSlider
//
//  Created by Artem H on 2/12/25.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var value: String
    
    var body: some View {
        TextField("", text: $value)
            .textFieldStyle(.roundedBorder)
            .frame(width: 80)
            .keyboardType(.numberPad)
    }
}

#Preview {
    TextFieldView(value: .constant("Test"))
}
