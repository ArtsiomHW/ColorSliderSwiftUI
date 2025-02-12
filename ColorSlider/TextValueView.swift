//
//  TextValueView.swift
//  ColorSlider
//
//  Created by Artem H on 2/12/25.
//

import SwiftUI

struct TextValueView: View {
    @Binding var value: Double
    
    var body: some View {
        Text(lround(value).formatted())
            .frame(width: 32, alignment: .trailing)
            .foregroundColor(.white)
    }
}

#Preview {
    TextValueView(value: .constant(255.0))
}
