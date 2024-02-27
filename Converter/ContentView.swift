//
//  ContentView.swift
//  Converter
//
//  Created by Eton  Hsu on 2/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0 //textfield
    @State private var firstUnit = "Celsius" //picker
    @State private var secondUnit = "Fahrenheit" // picker
    
    let tempUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var output: Double {
        var outputValue = 0.0
        
        //Celsius -> anything
        if firstUnit == "Celsius" {
            if secondUnit == "Fahrenheit" {
                outputValue = (9/5) * inputValue + 32
            } else if secondUnit == "Kelvin" {
                outputValue = inputValue + 273.15
            } else {
                outputValue = inputValue
            }
        }
        
        //Fahrenheit -> anything
        if firstUnit == "Fahrenheit" {
            if secondUnit == "Celsius" {
                outputValue = (inputValue - 32) * (5/9)
            } else if secondUnit == "Kelvin" {
                outputValue = ((inputValue - 32) * (5/9)) + 273.15
            } else {
                outputValue = inputValue
            }
        }
        
        //Kelvin -> anything
        if firstUnit == "Kelvin" {
            if secondUnit == "Celsius" {
                outputValue = inputValue - 237.15
            } else if secondUnit == "Fahrenheit" {
                outputValue = ((9/5) * inputValue + 32) + 273.15
            } else {
                outputValue = inputValue
            }
        }
        
        return outputValue
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Value") {
                    TextField("Input Value", value: $inputValue, format: .number)
                }
                
                Picker("Convert from", selection: $firstUnit) {
                    ForEach(tempUnits, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Convert to", selection: $secondUnit) {
                    ForEach(tempUnits, id: \.self) {
                        Text($0)
                    }
                }
                
                Section("Converted Value") {
                    Text(output.formatted(.number.precision(.significantDigits(2))))
                }
            }
            .navigationTitle("Converter")
        }
    }
}

#Preview {
    ContentView()
}
