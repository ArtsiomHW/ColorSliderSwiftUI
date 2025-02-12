//
//  ContentView.swift
//  ColorSlider
//
//  Created by Artem H on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var redColorValueTF = ""
    @State private var greenColorValueTF = ""
    @State private var blueColorValueTF = ""
    
    @State private var redColorValue = Double.random(in: 0...255)
    @State private var greenColorValue = Double.random(in: 0...255)
    @State private var blueColorValue = Double.random(in: 0...255)
    
    @State private var isPresented = false
    
    @FocusState private var isKeyboardFocused: Bool
    
    var body: some View {
        VStack(spacing: 40) {
            Rectangle()
                .fill(Color(
                    red: redColorValue / 255,
                    green: greenColorValue / 255,
                    blue: blueColorValue / 255
                ))
                .frame(maxWidth: .infinity, maxHeight: 140)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 4)
                )
            
            VStack(spacing: 24) {
                HStack(spacing: 16) {
                    TextValueView(value: $redColorValue)
                        .onChange(of: redColorValue, initial: true) {
                            redColorValueTF = lround(redColorValue).formatted()
                        }
                    SliderView(sliderValue: $redColorValue, tintColor: .red)
                    TextFieldView(value: $redColorValueTF)
                        .focused($isKeyboardFocused)
                }
                
                HStack(spacing: 16) {
                    TextValueView(value: $greenColorValue)
                        .onChange(of: greenColorValue, initial: true) {
                            greenColorValueTF = lround(greenColorValue).formatted()
                        }
                    SliderView(sliderValue: $greenColorValue, tintColor: .green)
                    TextFieldView(value: $greenColorValueTF)
                        .focused($isKeyboardFocused)
                }
                
                HStack(spacing: 16) {
                    TextValueView(value: $blueColorValue)
                        .onChange(of: blueColorValue, initial: true) {
                            blueColorValueTF = lround(blueColorValue).formatted()
                        }
                    SliderView(sliderValue: $blueColorValue, tintColor: .blue)
                    TextFieldView(value: $blueColorValueTF)
                        .focused($isKeyboardFocused)
                }
            }
            Spacer()

        }
        .padding()
        .padding(.top, 80)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.176, green: 0.412, blue: 0.733))
        .ignoresSafeArea()
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done", action: applyKeyboardChanges)
                    .alert("Wrong range", isPresented: $isPresented) { Button("OK") {} } message: { Text("Please enter a value between 0 and 255")}
            }
        }
        .onTapGesture {
            applyKeyboardChanges()
        }
    }
    
    private func applyKeyboardChanges() {
        if let redValue = Double(redColorValueTF),
           let greenValue = Double(greenColorValueTF),
           let blueValue = Double(blueColorValueTF),
           (redValue < 0 || redValue > 255 ||
            greenValue < 0 || greenValue > 255 ||
            blueValue < 0 || blueValue > 255) {
            redColorValueTF = lround(redColorValue).formatted()
            greenColorValueTF = lround(greenColorValue).formatted()
            blueColorValueTF = lround(blueColorValue).formatted()
            isPresented.toggle()
            return
        }
        
        isKeyboardFocused = false
        
        redColorValue = Double(redColorValueTF) ?? redColorValue
        greenColorValue = Double(greenColorValueTF) ?? greenColorValue
        blueColorValue = Double(blueColorValueTF) ?? blueColorValue
    }
}

#Preview {
    ContentView()
}
