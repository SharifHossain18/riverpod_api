import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/posts.dart';

class ApiServices{
  String url="https://reqres.in/api/users?page=1";


Future getusers()async{

    http.Response response=await http.get(Uri.parse(url));

    if (response.statusCode==200){
      final List result=jsonDecode(response.body)['data'];
     return result.map((e) => Data.fromJson(e)).toList();
    }

    else{
      throw Exception(response.contentLength);
    }
  }
}

final userProvider=Provider((ref) => ApiServices());