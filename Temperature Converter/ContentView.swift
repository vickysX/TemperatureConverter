//
//  ContentView.swift
//  Temperature Converter
//
//  Created by Vittorio Sassu on 11/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var inputIsFocused
    
    @State private var inputTemperature: Double = 0.0
    @State private var selectedMeasureUnit: MeasureUnit = .celsius
    @State private var selectedConversionMeasureunit: MeasureUnit = .fahrenheit
    
    var result: Double {
        switch (selectedMeasureUnit, selectedConversionMeasureunit) {
        case (.celsius, .fahrenheit):
            return convertFromCelsiusToFahr(inputTemperature)
        case (.celsius, .kelvin):
            return convertFromCelsiusToKelvin(inputTemperature)
        case (.fahrenheit, .celsius):
            return convertFromFahrToCelsius(inputTemperature)
        case (.fahrenheit, .kelvin):
            return convertFromFahrToKelvin(inputTemperature)
        case (.kelvin, .celsius):
            return convertFromKelvinToCelsius(inputTemperature)
        case (.kelvin, .fahrenheit):
            return convertFromKelvinToFahr(inputTemperature)
        default:
            return 0
        }
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    
                }
            }
            .navigationTitle("Temperature Converter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Retrieve raw values with .rawValue property
enum MeasureUnit: String {
    case celsius = "°C"
    case fahrenheit = "°F"
    case kelvin = "K"
}

func convertFromCelsiusToFahr(_ celsius: Double) -> Double {
    0
}

func convertFromCelsiusToKelvin(_ celsius: Double) -> Double {
    0
}

func convertFromFahrToCelsius(_ fahr: Double) -> Double {
    0
}

func convertFromFahrToKelvin(_ fahr: Double) -> Double {
    0
}

func convertFromKelvinToCelsius(_ kelvin: Double) -> Double {
    
}

func convertFromKelvinToFahr(_ kelvin: Double) -> Double {
    0
}

#Preview {
    ContentView()
}
