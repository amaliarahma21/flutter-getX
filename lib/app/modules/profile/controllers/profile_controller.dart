import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/api.dart';
class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  var isLoggedIn = true.obs;
  var users = {}.obs;
  

  @override
  void onInit(){
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async{
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var token = localStorage.getString('token');

      if (token == null) {
        throw Exception('Token not foud');
      } 

      var headers = {'Authorization' : 'Bearer $token'};

      var apiUrl = 'user';
      var response = await http.get(
        Uri.parse(Api.baseUrl + apiUrl),
        headers: headers
      );

      if (response.statusCode == 200) {
        var apiResponse = json.decode(response.body);
        users = apiResponse['rows'];
       
      } else {
        throw Exception('Failed to load user detail');
      }
    } catch (e) {
      print('Error during fetching user details: $e');
    } finally {
      isLoggedIn.value = false;
    }
  }

  Future<void> logout() async{
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('token');
      localStorage.remove('user');

      Get.offAllNamed('/login');
    } catch (e) {
      print('Error during logout: $e');
  }
  }
}