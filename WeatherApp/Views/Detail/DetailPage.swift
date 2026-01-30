
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
            Color(.background)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                Image(systemName: viewModel.location.weather.icon)
                    .font(.system(size: 60))
                    .foregroundColor(viewModel.location.weather.iconColor)
                
                Text(viewModel.location.name)
                    .font(.title)
                    .foregroundColor(.white)
                
                Text(viewModel.temperatureText)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                
                //            Text(viewModel.location.temperature.temperatureText)
                //                           .foregroundColor(.secondary)
                
                Spacer()
                
                if let error = viewModel.errorMessage {
                               Text(error)
                                   .foregroundColor(.red)
                                   .multilineTextAlignment(.center)
                           }

            }
            .padding()
            .task {
                await viewModel.fetchWeather()
            }
        }
    }
}
