import 'dart:convert';
import 'package:fetch_api_countries/model/country_list_model.dart';
import 'package:fetch_api_countries/provider/michale_provider.dart';
import 'package:fetch_api_countries/screen/cat_screen.dart';
import 'package:fetch_api_countries/screen/exampleScreen.dart';
import 'package:fetch_api_countries/screen/michael_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_)=>MicheleControler(),
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
        home: const  MichaelScreen()
    ),
  ));
}