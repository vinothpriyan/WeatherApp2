//
//  ContentView.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import SwiftUI

struct WeatherMainView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        ZStack {
            if networkManager.networkConnected {
                
                TopWeatherView()
                    .background(Color.gray.opacity(0.2))
                
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
        }
        .background(Image("weather_bg").opacity(0.7))
        .edgesIgnoringSafeArea([.leading, .trailing])
    }
}


struct WeatherMainView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMainView()
    }
}
