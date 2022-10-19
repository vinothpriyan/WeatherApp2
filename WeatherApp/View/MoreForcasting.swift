//
//  MoreForcasting.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import SwiftUI

struct MoreForcasting: View {
    var body: some View {
        HStack{
            Spacer()
            
            VStack(spacing: 10){
                Image(systemName: "sun.dust.fill")
                    .resizable()
                    .foregroundColor(.orange)
                    .frame(width: 40, height: 40)
                
                Text("UV Index")
                    .fontWeight(.semibold)
                    .font(.body)
                
                Text("Very Low")
                    .fontWeight(.thin)
                    .font(.caption)
                
            }
            
            Spacer()
            
            VStack(spacing: 10){
                Image(systemName: "wind")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 40, height: 40)
                
                Text("Wind")
                    .fontWeight(.semibold)
                    .font(.body)
                
                Text("10 km/h")
                    .fontWeight(.thin)
                    .font(.caption)
                
            }
            
            Spacer()
            
            VStack(spacing: 10){
                Image(systemName: "humidity")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 40, height: 40)
                
                Text("Humidity")
                    .fontWeight(.semibold)
                    .font(.body)
                
                Text("60%")
                    .fontWeight(.thin)
                    .font(.caption)
                
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.6))
        .cornerRadius(10)
        .padding(6)
    }
}

struct MoreForcasting_Previews: PreviewProvider {
    static var previews: some View {
        MoreForcasting()
    }
}
