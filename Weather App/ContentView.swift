//
//  ContentView.swift
//  Weather App
//
//  Created by Emine Büşra Yıldız on 8.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack{
                CityTextView (cityName: "Cupertino , CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", tempurate: 76)
                
                HStack(spacing : 20){
                    WeatherDayView(dayOfWeek: "TUE", 
                                   imageName: "cloud.sun.fill",
                                   tempurate: 74)
                    WeatherDayView(dayOfWeek: "WED", 
                                   imageName: "sun.max.fill",
                                   tempurate: 88)
                    WeatherDayView(dayOfWeek: "THU", 
                                   imageName: "wind.snow",
                                   tempurate: 55)
                    WeatherDayView(dayOfWeek: "FRI", 
                                   imageName: "sunset.fill",
                                   tempurate: 60)
                    WeatherDayView(dayOfWeek: "SAT", 
                                   imageName: "snow",
                                   tempurate: 25)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label:{
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek : String
    var imageName : String
    var tempurate : Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight:.medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
 //               .foregroundColor(.pink)
//                .foregroundStyle(.pink, .orange, .green)
                .frame(width: 40, height: 40)
            
            Text("\(tempurate)°")
                .font(.system(size: 28,  weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool

    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName : String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design:.default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {

    var imageName: String
    var tempurate : Int
    
    var body: some View{
        
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(tempurate)°")
                .font(.system(size: 70,  weight: .medium))
                .foregroundColor(.white)
        }
        
        .padding(.bottom ,40)
    }
    
}


