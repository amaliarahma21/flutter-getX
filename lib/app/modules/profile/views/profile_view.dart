import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  //  ProfileView({Key? key}) : super(key: key);

   final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => controller.logout(), icon: Icon(Icons.logout))
        ],
      ),
      body:  Obx(
        () => controller.isLoggedIn.value
           ? Center(child: CircularProgressIndicator())
           : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  'Nama: ${profileController.users['username']}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  'Email: ${profileController.users['email']}',
                  style: TextStyle(fontSize: 18),
                ),
                
              ],
            ),
          ))
  );
  }
}