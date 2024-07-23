//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Himanshu Kesharwani on 23/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack(spacing: 4) {
                CityView(cityName: "Noida, India")
                TemperatureView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                temperature: 28)
                Spacer()
                WeatherView()
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Date and Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
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
    var dayName: String
    var imageName: String
    var temperature: String
    
    var body: some View {
        VStack() {
            Text(dayName)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 54,height: 54)
            Text("\(temperature)°")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black :.blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TemperatureView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            Text("\(temperature)°")
                .font(.system(size: 72, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct CityView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .semibold,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .medium, design: .default))
            .foregroundColor(textColor)
            .frame(width: 280, height: 54, alignment: .center)
            .background(backgroundColor)
            .cornerRadius(8.0)
    }
}

struct WeatherView: View {
    var body: some View {
        HStack(spacing: 16) {
            WeatherDayView(dayName: "MON",
                           imageName: "cloud.sun.fill",
                           temperature: "28")
            WeatherDayView(dayName: "TUE",
                           imageName: "sun.max.fill",
                           temperature: "42")
            WeatherDayView(dayName: "WED",
                           imageName: "wind",
                           temperature: "32")
            WeatherDayView(dayName: "THU",
                           imageName: "sunset.fill",
                           temperature: "22")
            WeatherDayView(dayName: "FRI",
                           imageName: "snow",
                           temperature: "12")
        }
    }
}
