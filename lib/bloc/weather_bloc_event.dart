part of 'weather_bloc_bloc.dart';
sealed class WeatherBlocEvent event Equatble {
  const WeatherBlocEvent();
  @override
  List<Object> get props =>[];
}
class FetchWeather extends WeatherBlocEvent{

}
