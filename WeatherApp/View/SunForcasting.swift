//
//  SunForcasting.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import SwiftUI

struct SunForcasting: View {
    
    let astroData: Astro
    
    var body: some View {
        HStack{
            Spacer()
            
            VStack(spacing: 20){
                Text("Sunrise")
                    .fontWeight(.semibold)
                    .font(.body)
                
                Text(astroData.sunrise)
                    .fontWeight(.semibold)
                    .font(.caption)
                
                Image(systemName: "sunrise")
                    .resizable()
                    .foregroundColor(.orange)
                    .frame(width: 50, height: 50)
            }
            
            Spacer()
            
            VStack(spacing: 20){
                Text("Sunset")
                    .fontWeight(.semibold)
                    .font(.body)
                
                Text(astroData.sunset)
                    .fontWeight(.semibold)
                    .font(.caption)
                
                Image(systemName: "sunset")
                    .resizable()
                    .foregroundColor(Color.yellow)
                    .frame(width: 50, height: 50)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.accentColor.opacity(0.6))
        .cornerRadius(10)
        .padding(6)
    }
}
