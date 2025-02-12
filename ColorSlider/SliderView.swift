//
//  SliderView.swift
//  ColorSlider
//
//  Created by Artem H on 2/12/25.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    let tintColor: Color
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color.blue.opacity(0.4))
                .frame(height: 4)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(tintColor)
                .animation(.easeInOut(duration: 0.3), value: sliderValue)
        }
    }
}

#Preview {
    SliderView(sliderValue: .constant(128.0), tintColor: .red)
}
