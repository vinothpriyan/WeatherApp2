//
//  SevenDaysForcast.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import SwiftUI

struct SevenDaysForcast: View {
    
    let forcastDay: [ForcastDay]
    @State var imageLoader: ImageLoader = ImageLoader()
    @State var image: UIImage?
    
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
                        }.frame(minWidth: UIScreen.main.bounds.width * 0.1)
                        
                        Image(uiImage: image ?? UIImage(systemName: "cloud.sun.fill")!)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                            .onReceive(imageLoader.$data) { imageData in
                                self.image = UIImage(data: imageData)
                            }
                        
                        Text(String(format: "%.0f kph", dayForcast.day.maxwind_kph))
                            .fontWeight(.medium)
                            .font(.system(size: 10))
                            .frame(minWidth: 20)
                            
                        Text(String(format: "%.0f°", dayForcast.day.avgtemp_c))
                            .fontWeight(.medium)
                            .font(.caption)
                            .frame(minWidth: 20)
                        
                        Text(String(format: "%.0f°", dayForcast.day.avgtemp_f))
                            .fontWeight(.medium)
                            .font(.system(size: 12))
                            .frame(minWidth: 20)
                        
                    }.padding(8)
                    .onAppear{
                        self.imageLoader.loadImage(urlString: dayForcast.day.condition.icon)
                    }
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
