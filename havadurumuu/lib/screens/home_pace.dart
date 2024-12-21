import 'package:flutter/material.dart';
import 'package:havadurumuu/models/WaterModels.dart';
import 'package:havadurumuu/services/weather_services.dart';

class HomePace extends StatefulWidget {
  const HomePace({super.key});

  @override
  State<HomePace> createState() => _HomePaceState();
}

class _HomePaceState extends State<HomePace> {

  List<WeatherModels> _weathers = [];

  void _getWeatherData () async{

    _weathers = await  WeatherService().getWeatherData();
setState(() {

});
  }


  @override
  void initState() {

   _getWeatherData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: _weathers.length,
            itemBuilder: (context,index){
              final WeatherModels weather = _weathers[index];
              return Container(


                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color:  Colors.blue.shade700,
                  borderRadius: BorderRadius.circular(10),
                ),

                child:  Column(
                  children: [
                    Row(
                      children: [

                        Text( weather.gunn,style: TextStyle(
                          color: Colors.white,
                            fontSize: 18
                        ),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text( weather.durum,style: TextStyle(

                              fontSize: 18,
                              color: Colors.white,



                          ),),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Image.network(weather.ikon,
                        width: 150,
                        height: 150,),

                            Container(
                              padding: const EdgeInsets.all(40),
                              
                              
                              child: Column(
                                children: [
                                  Text( "Min:"+weather.min,style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white

                                  ),),
                                  Text("max:"+weather.max,style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white
                                  ),),
                                  Text("gece:"+weather.gece,style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white
                                  ),),
                                  Text("nem:"+weather.nem,style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white
                                  ),),

                                ],
                                                         ),
                            ),
                           

                      ],
                    ),

/*buraya gelicek icon altı*/

                    Text( "Derece:"+weather.derece,style: TextStyle(
                        fontSize: 18,
                        color: Colors.white

                    ),),



                  ],

                ),
              );
      },
      ),
       ),
      );


  }
}

