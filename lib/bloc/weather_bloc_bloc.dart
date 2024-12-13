import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial());

  @override
  Stream<WeatherBlocState> mapEventToState(
    WeatherBlocEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
