import 'package:equatable/equatable.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
 // Added the missing import
 class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherBlocEvent {
  final Position position;

  const FetchWeather(this.position);
  @override
  List<Object> get props => [position];

  // Empty class as per your requirements
}
