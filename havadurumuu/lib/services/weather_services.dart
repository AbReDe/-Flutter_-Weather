import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:havadurumuu/models/WaterModels.dart';

class WeatherService {

  Future getLocation()async{
    final bool serviceEnable = await Geolocator.isLocationServiceEnabled();

    if(!serviceEnable){
      Future.error("konum servisi kapalı");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if(permission== LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission== LocationPermission.denied){
        Future.error("konum izni vermelisin");
      }
    }

    final Position position=await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );

    final List<Placemark> placemark=
        await placemarkFromCoordinates(position.latitude, position.longitude);

    final String? city= placemark[0].administrativeArea;

    if(city==null)Future.error("bir sorun olustu");
    return city!;
  }

  Future<List<WeatherModels>> getWeatherData() async{

    final String city = await getLocation();

    final String url = "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city";
    const Map<String, dynamic> headers = {
      "authorization": "apikey 4I8DBYg8ETDeJrEZwwa0Pl:3Ht4IwjahVH2H75O2ecEDa",
      "content-type": "application/json"
    };

    final dio = Dio();

    final response = await dio.get(url, options: Options(headers: headers));

    if(response.statusCode!= 200){
      return Future.error("buyuk br 200 sorunu var");
    }
   final List list = response.data['result'];
    final List<WeatherModels> WeatherList =
        list.map((e) => WeatherModels.fromJson(e)).toList();

    return WeatherList;
  }

}