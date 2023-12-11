//
//  ContentView.swift
//  Temperature Converter
//
//  Created by Vittorio Sassu on 11/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var inputIsFocused: Bool
    
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
                Section("Enter input temperature") {
                    Picker("Choose input measure unit", selection: $selectedMeasureUnit) {
                        ForEach(MeasureUnit.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    TextField("Temperature", value: $inputTemperature, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                }
                Section("Select conversion measure unit") {
                    Picker("Select conversion measure unit", selection: $selectedConversionMeasureunit) {
                        ForEach(MeasureUnit.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Result") {
                    Text(result.formatted())
                }
            }
            .navigationTitle("Temperature Converter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if inputIsFocused {
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

// Retrieve raw values with .rawValue property
// It's conforming to the CaseIterable protocol
// so that I can use it inside a Picker
enum MeasureUnit: String, CaseIterable {
    case celsius = "°C"
    case fahrenheit = "°F"
    case kelvin = "K"
}

func convertFromCelsiusToFahr(_ celsius: Double) -> Double {
    convertFromKelvinToFahr(convertFromCelsiusToKelvin(celsius))
}

func convertFromCelsiusToKelvin(_ celsius: Double) -> Double {
    celsius + 273.15
}

func convertFromFahrToCelsius(_ fahr: Double) -> Double {
    convertFromKelvinToCelsius(convertFromFahrToKelvin(fahr))
}

func convertFromFahrToKelvin(_ fahr: Double) -> Double {
    fahr + 255.372
}

func convertFromKelvinToCelsius(_ kelvin: Double) -> Double {
    kelvin - 273.15
}

func convertFromKelvinToFahr(_ kelvin: Double) -> Double {
    kelvin - 255.372
}

#Preview {
    ContentView()
}
