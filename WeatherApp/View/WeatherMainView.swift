//
//  ContentView.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import SwiftUI

struct WeatherMainView: View {
    
    
    var body: some View {
        ZStack {
           
            TopWeatherView()
                .background(Color.gray.opacity(0.2))
            
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
