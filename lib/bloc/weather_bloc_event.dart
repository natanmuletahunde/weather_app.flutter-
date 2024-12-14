import 'package:equatable/equatable.dart';
 // Added the missing import
 class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherBlocEvent {
  // Empty class as per your requirements
}
