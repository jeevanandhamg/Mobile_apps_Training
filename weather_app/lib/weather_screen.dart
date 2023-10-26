import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Additional_information.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secretsfile.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  
   TextEditingController textEditingController  = TextEditingController();
   String city  = 'Palani';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // textEditingController.clear();
    getCurrentWeather();
  }

  

  Future getCurrentWeather() async {
    try {

    final res = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=$secretWeatherAPIKey'));
    final data =jsonDecode(res.body);
    if(data['cod']!='200') {
      throw data['message'];
    } else {
      return data;
    }
    } catch(e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
    
          ),
          ),
          centerTitle: true,
          actions:  [
           IconButton(onPressed: () {
           setState(() {
            //  textEditingController.clear();
            if(textEditingController.text!=null && textEditingController.text!=""){
                        city = textEditingController.text;
                        }
                        else{
            city = "Palani";
                        }
           });
           }, icon: const Icon(Icons.refresh))
          ],
        ),
        body:  FutureBuilder(
          future: getCurrentWeather(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if(snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
        
            final data = snapshot.data!;
            final currentTemp  = data['list'][0]['main']['temp'];
            final weatherName = data['list'][0]['weather'][0]['main'];
            final currentHumidity  = data['list'][0]['main']['humidity'];
            final currentPressure  = data['list'][0]['main']['pressure'];
            final currentWindSpeed  = data['list'][0]['wind']['speed'];
            
            
            return SingleChildScrollView(
              child: Center(
              child: Padding(
                padding:const EdgeInsets.all(16.0),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 370,
                          child: TextField(
                          
                                      controller: textEditingController,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      decoration:  InputDecoration(
                                        hintText: "Please enter your location",
                                        // border: OutlineInputBorder(
                                        //   borderRadius: BorderRadius.circular(17),
                                        // ),
                                        hintStyle: const TextStyle(
                          color:Colors.white,
                                        ),
                                        
                                        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                          style: BorderStyle.solid,
                          
                          strokeAlign: BorderSide.strokeAlignOutside
                          ),
                           borderRadius: BorderRadius.circular(17),
                          ),
                          enabledBorder: OutlineInputBorder(borderSide: const BorderSide(
                          color: Colors.white,
                          
                          ),
                          borderRadius: BorderRadius.circular(17),
                          ),
                            //  suffixIcon:   const Icon(Icons.search,size: 32,)
                             suffixIcon: GestureDetector(
                    onTap: () {
                      // Perform your action here
                      print('Suffix icon tapped!$textEditingController.text');
                      setState(() {
                        if(textEditingController.text!=null && textEditingController.text!=""){
                        city = textEditingController.text;
                        }
                      });
                      // You can replace the print statement with the desired action.
                    },
                    child: const Icon(Icons.search,size: 32,), // Replace with your desired icon
                  ),
                         ),
                                      cursorColor: Colors.white,
                                      // keyboardType: const TextInputType.numberWithOptions(
                                      //   decimal: true,
                                      // signed: false),
                                      // textAlign: TextAlign.center,
                                     ),
                                     
                        ),
               
                      ],
                    ),
                    const SizedBox(height: 16,),
                    Container(
                      width: double.infinity,
                      child:  Card(
                        elevation: 19,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        // shadowColor: Colors.white70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                            child:  Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text('$currentTemp K',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                  const SizedBox(height: 16,),
                                  weatherName=='Clouds' || weatherName=='Rain'? Icon(Icons.cloud,size: 32,):Icon(Icons.sunny),
                                   const SizedBox(height: 16,),
                                   Text('$weatherName',style: const TextStyle(
                                    fontSize: 22,
                                    // fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    const Text('Weather Forecast',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),),
                     const SizedBox(height: 8,),
                      //  SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                          
                      //   children: [
                      //     for(int i=0;i<5;i++) 
                      //     HourlyForeCastItem(
                      //       time: data['list'][i]['dt'].toString(),
                      //       temperature: data['list'][i]['main']['temp'].toString(),
                      //       icon: data['list'][i]['weather'][0]['main']=='Clouds' || data['list'][i]['weather'][0]['main']=='Rain'? Icon(Icons.cloud,size: 32,):Icon(Icons.sunny),
                      //     ),
                      //   ],
                      //                ),
                      // ),
                  
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context,i) {
                            final time = DateTime.parse(data['list'][i]['dt_txt']);
                            return HourlyForeCastItem(
                              time: DateFormat.j().format(time).toString(), 
                              temperature: data['list'][i]['main']['temp'].toString(), 
                              icon: data['list'][i]['weather'][0]['main']=='Clouds' || data['list'][i]['weather'][0]['main']=='Rain'? Icon(Icons.cloud,size: 32,):Icon(Icons.sunny,size: 32,)
                            );
                          }
                        ),
                      ),
                      const SizedBox(height: 16,),
                    const Text('Additional Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 8,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AdditionInformation(
                          icon: Icons.water_drop,
                          label: 'Humidity',
                          value:  currentHumidity.toString(),
                        ),
                        AdditionInformation(
                          icon: Icons.air,
                          label: 'Wind speed',
                          value: currentWindSpeed.toString(),
                        ),
                        AdditionInformation(
                          icon: Icons.beach_access,
                          label: 'Pressure',
                          value: currentPressure.toString(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
                    ),
            );
          },
        
        ),
      ),
    );
  }
}
