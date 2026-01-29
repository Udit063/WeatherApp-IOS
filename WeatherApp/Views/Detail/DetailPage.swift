
//

import SwiftUI

struct WeatherView: View {

    @StateObject private var viewModel: WeatherViewModel
    
    init(location: Location) {
           _viewModel = StateObject(
               wrappedValue: WeatherViewModel(location: location)
           )
    }


    var body: some View {
        ZStack{
            Color(red: 0.03, green: 0.08, blue: 0.20)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                Image(systemName: viewModel.location.weather.icon)
                    .font(.system(size: 60))
                    .foregroundColor(viewModel.location.weather.iconColor)
                
                Text(viewModel.location.name)
                    .font(.title)
                    .foregroundColor(.white)
                
                Text(viewModel.liveTemperature)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                
                //            Text(viewModel.location.temperature.temperatureText)
                //                           .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding()
            .task {
                await viewModel.fetchWeather()
            }
        }
    }
}
