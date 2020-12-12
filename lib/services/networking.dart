import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';


class NetworkHelper{

  String url;

  NetworkHelper({this.url});

  Future getData() async{
    Response response = await get(url);
    if(response.statusCode == 200){
      var decodedData = jsonDecode(response.body);

      return decodedData;
    }else{
      print(response.statusCode);
    }
  }

}