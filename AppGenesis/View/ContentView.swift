//
//  ContentView.swift
//  AppGenesis
//
//  Created by LT on 1/28/24.
//

import SwiftUI

struct ContentView: View {
  @State private var redSliderValue   = 99.0
  @State private var greenSliderValue = 40.0
  @State private var blueSliderValue  = 75.0
  @State private var defaultColor = Color(red: (99.0/255), green: (40.0/255), blue: (75.0/255))
  var body: some View {
    
    
    VStack {
      
      Text("Color Picker")
        .font(.title)
      
      RoundedRectangle(cornerRadius: 5)
        .fill(defaultColor)
        .frame(width: 350, height: 300)
      
      Text("Red")
      HStack {
        Slider(value: $redSliderValue, in: 1.0...100.0)
        Text(String(Int(redSliderValue)))
      }
      Text("Green")
      HStack {
        Slider(value: $greenSliderValue, in: 1.0...100.0)
        Text(String(Int(greenSliderValue)))
      }
      Text("Blue")
      HStack {
        Slider(value: $blueSliderValue, in: 1.0...100.0)
        Text(String(Int(blueSliderValue)))
      }
      
      Button(action: {
        print("tapped!")
        defaultColor = Color(red: (redSliderValue/255), green: (greenSliderValue/255), blue: (blueSliderValue/255))
      }, label: {
        Text("Set Color")
          .foregroundColor(.white)
          .frame(width: 200, height: 40)
          .background(Color.gray)
          .cornerRadius(15)
          .padding()
      })
      
    }
    
  }
  
  
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
