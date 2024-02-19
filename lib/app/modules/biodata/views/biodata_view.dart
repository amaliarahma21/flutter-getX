import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/biodata_controller.dart';

class BiodataView extends GetView<BiodataController> {
  const BiodataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BiodataView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BiodataView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
