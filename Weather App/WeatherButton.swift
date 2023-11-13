//
//  WeatherButton.swift
//  Weather App
//
//  Created by Emine Büşra Yıldız on 9.11.2023.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor:Color
    var backgroundColor: Color
    
    var body: some View {
       
        VStack(spacing: 20){
            Text(title)
                .bold()
                .frame(width: 280, height: 50)
                .background(backgroundColor.gradient)
                .cornerRadius(10)
            
        }
        .foregroundColor(textColor)
        .font(.system(size: 20, weight: .bold, design: .default))
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View{
        WeatherButton(title: "Test Title", textColor: .white, backgroundColor: .blue)
    }
}
