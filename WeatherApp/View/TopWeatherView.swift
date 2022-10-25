//
//  TopWeatherView.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import SwiftUI

struct TopWeatherView: View{
    
        @ObservedObject var currentWeatherData: WeatherDataViewModel = WeatherDataViewModel()
        @ObservedObject var networkManager = NetworkManager()
       
    var body: some View{
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
                }
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
