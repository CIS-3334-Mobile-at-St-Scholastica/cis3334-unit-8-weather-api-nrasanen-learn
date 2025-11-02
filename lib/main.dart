import 'package:flutter/material.dart';
import 'models/weather_model.dart';
import 'services/weather_service.dart' as weather_scv;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CIS 3334 Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Widget weatherImage() {
  daily.weather[0].main
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<WeatherData>> futureWeatherForcasts;
  Widget weatherTile (int position, {required Text title, required subtitle, required Widget leading}) {
    print ("Inside weatherTile and setting up tile for positon ${position}");
    return ListTile(
      leading: Image(image: AssetImage('graphics/sun.png')),
      title: Text("Title Here"),
      subtitle: Text("Subtitle Here"),
    );
  }

  @override
  initState() {
    weather_scv.WeatherDataService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: futureWeatherForcasts,
        builder: (context, snapshot) {
          if (snapshot.data == null ||
              snapshot.connectionState == ConnectionState.none) {
            return Container();
          }
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int position) {
              WeatherData weather = snapshot.data![position];
              return Card(
                child: weatherTile(position,
                    leading: weatherImage(),
                    title: Text("The weather today will be ${weather.list.first.main.temp} today"),
                    subtitle: Text("It will feel like ${weather.list.first.main.feelsLike} degrees today"
                ),
                )
              );
            },
          );
        }
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}