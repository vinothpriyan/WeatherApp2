//
//  TopWeatherView.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import SwiftUI

struct TopWeatherView: View{
    @ObservedObject var currentWeatherData: WeatherDataViewModel = WeatherDataViewModel()
    @State private var customLocation: String = ""
    var body: some View{
        
        VStack{
            
            HStack{
                TextField("Location", text: $customLocation)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Button {
                    self.currentWeatherData.fetchedRecords(searchLocation: customLocation)
                } label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
            }
            .padding(8)
            .background(Color.white.opacity(0.6))
            .cornerRadius(10)
            .padding(.horizontal, 10)
            .padding(.top, 10)

            Spacer(minLength: 20)
            
            HStack(spacing: 0){
                VStack{
                    Text("\(self.currentWeatherData.responseweatherData?.current.temp_c ?? 0)° ")
                        .fontWeight(.semibold)
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                  
                    Text(self.currentWeatherData.responseweatherData?.location.name ?? "No Region Found")
                        .fontWeight(.black)
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding(.leading, 10)
                    
                    Text("\(self.currentWeatherData.responseweatherData?.current.temp_c ?? 0)°/\(self.currentWeatherData.responseweatherData?.current.temp_f ?? 0)° Feels like \(self.currentWeatherData.responseweatherData?.current.feelslike_c ?? 0)°")
                        .fontWeight(.semibold)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.leading, 10)
                    Text(self.currentWeatherData.responseweatherData?.location.localtime ?? "")
                        .fontWeight(.semibold)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.leading, 10)
                    
                }.padding()
                    
                Spacer()
                
                Image(systemName: "cloud.sun.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(Color.white)
                    .padding(.trailing, 10)
                
            }.cornerRadius(10)
            
            Spacer()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                Text("Hourly Today")
                    .fontWeight(.bold)
                    .font(.callout)
                
                CurrentDayForcast()
                    .padding(8)
                    .background(Color.blue.opacity(0.3))
                    .cornerRadius(10)
                    .padding(8)
                
                Text("For This Week")
                    .fontWeight(.bold)
                    .font(.callout)
                
                SevenDaysForcast()
                    .padding(8)
                    .background(Color.blue.opacity(0.3))
                    .cornerRadius(10)
                    .padding(6)
                
                SunForcasting()
                
                MoreForcasting()
                
            }
        }.onAppear{
            self.currentWeatherData.fetchedRecords()
        }
    }
}

struct TopWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TopWeatherView()
    }
}
