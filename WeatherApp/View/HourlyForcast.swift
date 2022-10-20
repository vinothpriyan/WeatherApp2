//
//  CurrentDayForcast.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import SwiftUI

struct HourlyForcast: View {
    
    let hourlyData: [HourlyData]
    @ObservedObject var imageLoader = ImageLoader()
    @State var image: UIImage?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(hourlyData, id: \.self) { hourlyForcast in
                    VStack(spacing: 20){
                        Text("\(DateFormatter.localizedString(from: hourlyForcast.time_epoch, dateStyle: .none, timeStyle: .short))")
                            .fontWeight(.medium)
                            .font(.caption)
                        
                        Image(uiImage: (image ?? UIImage(systemName: "cloud.fill"))!)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 20)
                            .onReceive(imageLoader.$data) { imgData in
                                //guard let img = imgData else{return}
                                self.image = UIImage(data: imgData)
                            }
                        
                        Text(String(format: "%.1f", hourlyForcast.temp_c))
                            .fontWeight(.medium)
                            .font(.caption)
                        
                        Text(String(format: "%.1f", hourlyForcast.temp_f))
                            .fontWeight(.medium)
                            .font(.caption)
                    }.padding(8)
                    .onAppear{
                        self.imageLoader.loadImage(urlString: hourlyForcast.condition.icon)
                    }
                }
            }
        }
    }
}

//struct HourlyForcast_Previews: PreviewProvider {
//    static var previews: some View {
//        HourlyForcast()
//    }
//}
