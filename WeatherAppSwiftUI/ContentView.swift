//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Sudhanshu Sudhanshu on 09/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityNameView(cityName: "Lucknow")
                
                CenterWeatherStatusView(day: "", imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)

                FutureDayStatusView()

                Spacer()

                Button {
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time")
                }
                
                Spacer()
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

struct WeatherDayView: View {
    
    var day: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack (spacing: 4) {
            Text(day)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : Color.blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityNameView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CenterWeatherStatusView: View {
    
    var day: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack (spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200, alignment: .center)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 50)
    }
}

struct FutureDayStatusView: View {
    var body: some View {
        HStack (spacing: 24) {
            WeatherDayView(day: "TUE", imageName: "cloud.sun.fill", temperature: 70)
            
            WeatherDayView(day: "TUE", imageName: "cloud.sun.fill", temperature: 70)
            
            WeatherDayView(day: "TUE", imageName: "cloud.sun.fill", temperature: 70)
            
            WeatherDayView(day: "TUE", imageName: "cloud.sun.fill", temperature: 70)
            
            WeatherDayView(day: "TUE", imageName: "cloud.sun.fill", temperature: 70)
        }
        
    }
}

struct WeatherButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
                .frame(width: 280, height: 40)
                .background(Color.white)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
    }
}
