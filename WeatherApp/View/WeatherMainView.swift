//
//  ContentView.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import SwiftUI

struct WeatherMainView: View {
    @ObservedObject var currentWeatherData: WeatherDataViewModel = WeatherDataViewModel()
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        ZStack {
            GeometryReader{ proxySize in
                if networkManager.networkConnected{
                    if proxySize.size.width < proxySize.size.height {
                        
                        PortraitWeatherView(currentWeatherData: currentWeatherData)
                           
                    }else{
                        LandscapWeatherView(currentWeatherData: currentWeatherData, size: proxySize.size.width)
                    }
                }else{
                    VStack{
                        Image(systemName: "network")
                            .resizable()
                            .foregroundColor(Color.blue)
                            .frame(width: 50, height: 50)
                        
                        Text("Your Internet Connection was failed..")
                            .fontWeight(.semibold)
                            .font(.body)
                            .foregroundColor(.red)
                        
                        Button {
                            self.networkManager.checkInternetConnection()
                        } label: {
                            HStack{
                                Image(systemName: "goforward")
                                    .resizable()
                                    .foregroundColor(Color.white)
                                    .frame(width: 50, height: 50)
                                
                                Text("Try Again")
                                    .fontWeight(.semibold)
                                    .font(.body)
                                    .foregroundColor(.red)
                            }.padding()
                                .background(Color.accentColor)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }.onAppear{
                self.currentWeatherData.fetchedRecords()
            }
        }
        .background(Image("weather_bg").opacity(0.7))
        .edgesIgnoringSafeArea([.leading, .trailing])
    }
}

public func customDate(date: Date)-> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEE"
    return dateFormatter.string(from: date)
}

extension View{
    public func hideKeyboard(){
        let hideOnce = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(hideOnce, to: nil, from: nil, for: nil)
    }
}

struct WeatherMainView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMainView()
    }
}
