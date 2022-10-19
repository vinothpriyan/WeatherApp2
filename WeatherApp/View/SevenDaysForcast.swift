//
//  SevenDaysForcast.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import SwiftUI

struct SevenDaysForcast: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10){
                ForEach(0..<7) { hourlyForcast in
                    HStack(spacing: 30){
                        Text("18 Nov 22")
                            .fontWeight(.medium)
                            .font(.caption)
                        
                        HStack{
                            Image(systemName: "cloud.drizzle.fill")
                                .resizable()
                                .font(.caption)
                                .frame(width: 10, height: 10)
                            
                            Text("59%")
                                .fontWeight(.semibold)
                                .font(.system(size: 8))
                        }
                        
                        Image(systemName: "cloud.drizzle.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                        
                        Image(systemName: "cloud.sun.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 20, height: 20)
                        
                        Text("90° f")
                            .fontWeight(.medium)
                            .font(.caption)
                        
                        Text("30° c")
                            .fontWeight(.medium)
                            .font(.caption)
                        
                    }.padding(8)
                        
                }
            }
        }
    }
}

struct SevenDaysForcast_Previews: PreviewProvider {
    static var previews: some View {
        SevenDaysForcast()
    }
}
