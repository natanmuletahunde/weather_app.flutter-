import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/bloc/weather_bloc_bloc.dart';
import 'package:weatherapp/bloc/weather_bloc_event.dart';
import 'package:weatherapp/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<Position>(
        future: _determinePosition(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            // While the Future is still running
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snap.hasError) {
            // When there's an error in the Future
            return Scaffold(
              body: Center(
                child: Text(
                  'Error: ${snap.error}', // Display the error message
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
              ),
            );
          } else if (snap.hasData) {
            // When the Future completes successfully
            return BlocProvider<WeatherBlocBloc>(
              create: (context) => WeatherBlocBloc()
                ..add(
                  FetchWeather(snap.data as Position),
                ),
              child: const HomeScreen(),
            );
          } else {
            // Default case (if none of the above are satisfied)
            return const Scaffold(
              body: Center(
                child: Text(
                  'Unexpected error occurred.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

/// Determine the current position of the device.
///
/// This function checks for location services and permissions.
/// If successful, it returns the device's current position.
/// Otherwise, it throws an appropriate error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  // Check the current permission status
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // Request permissions
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are permanently denied
    return Future.error(
        'Location permissions are permanently denied. Please enable them in settings.');
  }

  // Retrieve the current position
  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return position;
  } catch (e) {
    return Future.error('Failed to get location: $e');
  }
}
