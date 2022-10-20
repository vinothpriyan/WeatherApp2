//
//  CurrentDayForcast.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import SwiftUI

struct HourlyForcast: View {
    
    let hourlyData: [HourlyData]
    @State var image: UIImage?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(hourlyData, id: \.self) { hourlyForcast in
                    VStack(spacing: 20){
                        Text("\(DateFormatter.localizedString(from: hourlyForcast.time_epoch, dateStyle: .none, timeStyle: .short))")
                            .fontWeight(.medium)
                            .font(.caption)
                        
                        Image(systemName: "cloud.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 20)
                            
                        Text(String(format: "%.0f°", hourlyForcast.temp_c))
                            .fontWeight(.medium)
                            .font(.caption)
                        
                        HStack{
                            Image(systemName: "cloud.rain.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 15, height: 15)
                            
                            Text("\(Int(hourlyForcast.humidity))%")
                                .fontWeight(.thin)
                                .font(.caption)
                        }
                        
                    }.padding(8)
                }
            }
        }
    }
}
