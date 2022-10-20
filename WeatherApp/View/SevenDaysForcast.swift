//
//  SevenDaysForcast.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import SwiftUI

struct SevenDaysForcast: View {
    
    let forcastDay: [ForcastDay]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10){
                ForEach(forcastDay, id: \.self) { dayForcast in
                    HStack(spacing: 30){
                        Text("\(customDate(date: dayForcast.date_epoch))")
                            .fontWeight(.medium)
                            .font(.caption)
                        
                        Spacer()
                        
                        HStack{
                            Image(systemName: "cloud.drizzle.fill")
                                .resizable()
                                .font(.caption)
                                .frame(width: 10, height: 10)
                            
                            Text("\(Int(dayForcast.day.avghumidity))%")
                                .fontWeight(.thin)
                                .font(.system(size: 8))
                        }.frame(minWidth: 40)
                        
                        Image(systemName: "cloud.drizzle.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                        
                        Image(systemName: "cloud.sun.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 20, height: 20)
                        
                        Text(String(format: "%.0f°", dayForcast.day.avgtemp_c))
                            .fontWeight(.medium)
                            .font(.caption)
                        
                        Text(String(format: "%.0f°", dayForcast.day.avgtemp_f))
                            .fontWeight(.medium)
                            .font(.caption)
                        
                    }.padding(8)
                        
                }
            }
        }
    }
    
    
    private func customDate(date: Date)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: date)
    }
}
