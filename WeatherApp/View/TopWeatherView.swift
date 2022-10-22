//
//  TopWeatherView.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import SwiftUI

struct TopWeatherView: View{
    
        @State var currentWeatherData: WeatherDataViewModel = WeatherDataViewModel()
        @State var imageLoder: ImageLoader = ImageLoader()
        @ObservedObject var networkManager = NetworkManager()
        @State private var customLocation: String = ""
        @State private var celsiusIsActive: Bool = true
        @State var image: UIImage?
    
    var body: some View{
        GeometryReader{ proxySize in
            if proxySize.size.width < proxySize.size.height {
                PortraitWeatherView(currentWeatherData: $currentWeatherData, imageLoder: $imageLoder, customLocation: $customLocation, celsiusIsActive: $celsiusIsActive, action: {self.currentWeatherData.fetchedRecords(searchLocation: customLocation)})
                   
            }else{
                LandscapWeatherView(currentWeatherData: $currentWeatherData, imageLoder: $imageLoder, customLocation: $customLocation, celsiusIsActive: $celsiusIsActive, size: proxySize.size.width, action: { self.currentWeatherData.fetchedRecords(searchLocation: customLocation)
                })
            }
        }
    }
}
//            VStack{
//                HStack{
//                    TextField("Location", text: $customLocation)
//                        .font(.headline)
//                        .foregroundColor(.primary)
//
//                    Button {
//                        withAnimation(.easeIn) {
//                            self.currentWeatherData.fetchedRecords(searchLocation: customLocation)
//                        }
//                    } label: {
//                        Image(systemName: "magnifyingglass.circle.fill")
//                            .resizable()
//                            .frame(width: 25, height: 25)
//                    }.disabled(customLocation.isEmpty ? true: false)
//                }
//                .padding(8)
//                .background(Color.white.opacity(0.6))
//                .cornerRadius(10)
//                .padding(.horizontal, 10)
//                .padding(.top, 10)
//
//                Spacer(minLength: 20)
//
//                HStack(spacing: 0){
//                    VStack{
//                        HStack{
//
//                            if let weather = self.currentWeatherData.responseweatherData?.current{
//                                Text("\(Int(celsiusIsActive ? weather.temp_c: weather.temp_f))")
//                                    .fontWeight(.semibold)
//                                    .font(.largeTitle)
//                                    .foregroundColor(.primary)
//
//                                Text(celsiusIsActive ? "°C": "°F")
//                                    .fontWeight(.semibold)
//                                    .font(.largeTitle)
//                                    .foregroundColor(.primary)
//                                    .onTapGesture {
//                                        self.celsiusIsActive.toggle()
//                                    }
//                            }
//                        }
//
//                        Text("\(self.currentWeatherData.responseweatherData?.location.name ?? "No Region Found")")
//                            .fontWeight(.black)
//                            .font(.title)
//                            .foregroundColor(.primary)
//                            .padding(.leading, 10)
//
//                        if let weatherFeel = self.currentWeatherData.responseweatherData {
//                            Text("\(Int(celsiusIsActive ? weatherFeel.current.temp_c: weatherFeel.current.temp_f))°/\(Int(celsiusIsActive ? weatherFeel.forecast.forecastday[0].day.maxtemp_c: weatherFeel.forecast.forecastday[0].day.maxtemp_f))° Feels like \(Int(celsiusIsActive ? weatherFeel.current.feelslike_c: weatherFeel.current.feelslike_f))°")
//                                .fontWeight(.semibold)
//                                .font(.caption)
//                                .foregroundColor(.primary)
//                                .padding(.leading, 10)
//                        }
//
//                        Text("\(customDate(date: self.currentWeatherData.responseweatherData?.location.localtime_epoch ?? Date())) \(DateFormatter.localizedString(from: self.currentWeatherData.responseweatherData?.location.localtime_epoch ?? Date(), dateStyle: .none, timeStyle: .short))")
//                            .fontWeight(.semibold)
//                            .font(.caption)
//                            .foregroundColor(.primary)
//                            .padding(.leading, 10)
//
//                    }.padding()
//
//                    Spacer()
//
//                    Image(uiImage: (image ?? UIImage(systemName: "cloud.moon.fill"))!)
//                        .resizable()
//                        .frame(width: 60, height: 60)
//                        .foregroundColor(Color.white)
//                        .padding(.trailing, 10)
//                        .onReceive(imageLoder.$data) { imageData in
//                            self.image = UIImage(data: imageData)
//                        }
//
//                }.cornerRadius(10)
//
//                Spacer()
//
//                ScrollView(.vertical, showsIndicators: false) {
//
//                    Text("Hourly Today")
//                        .fontWeight(.bold)
//                        .font(.callout)
//
//                    if let hourly = self.currentWeatherData.responseweatherData?.forecast.forecastday{
//                        HourlyForcast(hourlyData: hourly[0].hour, celsiusIsActive: $celsiusIsActive)
//                            .padding(8)
//                            .background(Color.accentColor.opacity(0.6))
//                            .cornerRadius(10)
//                            .padding(8)
//
//                    }
//
//                    Text("For \(self.currentWeatherData.responseweatherData?.forecast.forecastday.count ?? 0) Days Forcasting")
//                        .fontWeight(.bold)
//                        .font(.callout)
//
//                    if let daysForcast = self.currentWeatherData.responseweatherData?.forecast{
//                        SevenDaysForcast(forcastDay: daysForcast.forecastday)
//                            .padding(8)
//                            .background(Color.accentColor.opacity(0.6))
//                            .cornerRadius(10)
//                            .padding(6)
//                    }
//
//                    if let astro = self.currentWeatherData.responseweatherData?.forecast.forecastday{
//                        SunForcasting(astroData: astro[0].astro)
//                    }
//
//                    if let currentData = self.currentWeatherData.responseweatherData?.current{
//                        MoreForcasting(currentData: currentData)
//                    }
//                }
//            }.onAppear{
//                if networkManager.networkConnected{
//                    self.currentWeatherData.fetchedRecords()
//                    self.imageLoder.loadImage(urlString: "//cdn.weatherapi.com/weather/64x64/day/116.png")
//        //            if let imageUrl = self.currentWeatherData.responseweatherData?.current.condition.icon {
//        //                self.imageLoder.loadImage(urlString: "//cdn.weatherapi.com/weather/64x64/day/116.png")
//        //            }
//                }
//            }
//            .onTapGesture {
//                hideKeyboard()
//            }
//        }
    


struct TopWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TopWeatherView()
    }
}

extension View{
    public func hideKeyboard(){
        let hideOnce = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(hideOnce, to: nil, from: nil, for: nil)
    }
}
