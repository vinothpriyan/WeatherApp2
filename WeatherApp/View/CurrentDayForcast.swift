//
//  CurrentDayForcast.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import SwiftUI

struct CurrentDayForcast: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(0..<10) { hourlyForcast in
                    VStack(spacing: 20){
                        Text("04.5am")
                            .fontWeight(.medium)
                            .font(.caption)
                        
                        Image(systemName: "cloud.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 20)
                        
                        Text("30° c")
                            .fontWeight(.medium)
                            .font(.caption)
                        
                        Text("90° f")
                            .fontWeight(.medium)
                            .font(.caption)
                    }.padding(8)
                }
            }
        }
    }
}

struct CurrentDayForcast_Previews: PreviewProvider {
    static var previews: some View {
        CurrentDayForcast()
    }
}
