import 'package:fetch_api_countries/model/michael_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class MicheleControler with ChangeNotifier{
  MichaelModel? micheleDetails;
  bool loading = false;

  Future fetchMichaelData() async{
    loading = true;
    var response  = await http.get(Uri.parse("https://api.agify.io/?name=michael"));
    if(response.statusCode == 200){
        micheleDetails = michaelModelFromJson(response.body);
        loading=false;
        notifyListeners();
      return micheleDetails;
    }
    else{
      loading = false;
      notifyListeners();
    }
  }
}