import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/pages/home.dart';
import 'package:web_app/utils/colors.dart';
import 'package:web_app/utils/drawerprovider.dart';
import 'package:web_app/utils/navigationprovider.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> DrawerProvider()),
      ChangeNotifierProvider(create: (_)=> NavigationProvider()),
    ],
    child: Builder(builder: (BuildContext context){
      return
        MaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'Burlington City Cab',
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'HindSiliguri',
            scaffoldBackgroundColor: Colors.grey,
            brightness: Brightness.light,
            primaryColor: AppColors.primaryColor,

          ),
          home: const Home(),
        );
    }),
    );
  }
}