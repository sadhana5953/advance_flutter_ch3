import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          if (snapshot.data!.contains(ConnectivityResult.mobile)) {
            return Text('Mobile is Connected');
          }else if(snapshot.data!.contains(ConnectivityResult.wifi))
            {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/wifi.png'),
                    SizedBox(height: 10,),
                    Text('Mobile connected to WiFi',style: TextStyle(color: Colors.blueGrey.shade700,fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              );
            }else
              {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 250,
                        width: 250,
                        margin: EdgeInsets.only(top: 20,bottom: 15),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                          image: DecorationImage(image: AssetImage('assets/images/bg.png'),fit: BoxFit.cover),
                        ),
                      ),
                      Text('No internet connection',style: TextStyle(color: Colors.blueGrey.shade600,fontWeight: FontWeight.bold,fontSize: 20),),
                      Text('Please check your internet connection\n and try again',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,),
                      // Image.asset('assets/images/bg.png'),
                    ],
                  ),
                );
              }
        },
      ),
    );
  }
}
