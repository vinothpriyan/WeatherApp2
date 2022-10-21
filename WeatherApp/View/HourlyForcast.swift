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
    @Binding var celsiusIsActive: Bool
    @State var imageLoader: ImageLoader = ImageLoader()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(hourlyData, id: \.self) { hourlyForcast in
                    VStack(spacing: 20){
                        Text("\(DateFormatter.localizedString(from: hourlyForcast.time_epoch, dateStyle: .none, timeStyle: .short))")
                            .fontWeight(.medium)
                            .font(.caption)
                        
                        Image(uiImage: image ?? UIImage(systemName: "cloud.moon.rain.fill")!)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 20)
                            .onReceive(imageLoader.$data) { imageData in
                                self.image = UIImage(data: imageData)
                            }
                        
                        Text(String(format: "%.0f°", celsiusIsActive ? hourlyForcast.temp_c: hourlyForcast.temp_f))
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
                    .onAppear{
                        self.imageLoader.loadImage(urlString: hourlyForcast.condition.icon)
                    }
                }
            }
        }
    }
}
