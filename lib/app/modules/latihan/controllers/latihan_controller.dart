import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LatihanController extends GetxController {
  var fullname = ''.obs;
  var placeofbirth = ''.obs;
  var dateofbirth = ''.obs;
  var gender = ''.obs;
  var email = ''.obs;
  var nationality = ''.obs;
  var harga = ''.obs;
  var payment = ''.obs;
  var cardnumber = ''.obs;
  var expireddate = ''.obs;
  var membership = ''.obs;

  // final List<String> typeList = [
  //   'Reguler',
  //   'Gold',
  //   'Platinum',
  //   'VIP',
  // ];

  var benefits = ''.obs;

  // var type = <String>[].obs;

  // List<String> getTypeList() => typeList;

  var isFormSubmitted = false.obs;
  var selectedbirthDate = ''.obs;
  Future<void> selectbirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      selectedbirthDate.value = formattedDate;
    }
  }

  RxString calculateAge() {
    if (selectedbirthDate.value.isNotEmpty) {
      DateTime dob = DateFormat('yyy-MM-dd').parse(selectedbirthDate.value);
      DateTime now = DateTime.now();
      int age = now.year - dob.year;
      int monthNow = now.month;
      int monthDob = dob.month;
      if (monthNow < monthDob || (monthNow == monthDob && now.day < dob.day)) {
        age--;
      }
      return age.toString().obs;
    }
    return ''.obs;
  }

  // var selectedexpiredDate = ''.obs;
  // Future<void> selectexpiredDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //   );

  //   if (picked != null) {
  //     final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
  //     selectedexpiredDate.value = formattedDate;
  //   }
  // }

  // void toggleType(String typeValue) {
  //   if (type.contains(typeValue)) {
  //     type.remove(typeValue);
  //   } else {
  //     type.add(typeValue);
  //   }
  // }
  
  void togglemembership(String membershipValue) {
    membership.value = membershipValue;
    if (membership == "Reguler") {
      harga.value = "50000";
      benefits.value = "Anggota 1 Bulan";
    } else if (membership == "Gold") {
      harga.value = "150000";
      benefits.value = "Anggota 1 Bulan + cemilan gratis";
    } else if (membership == "Platinum") {
      harga.value = "250000";
      benefits.value = "Anggota 2 Bulan + Free Wifi";
    } else if (membership == "VIP") {
      harga.value = "500000";
      benefits.value = "Anggota 3 Bulan + Free Wifi + Tiket Konser";
    }
  }

  var selectedexpiredDate = ''.obs;
  Future<void> selectExpiredDate() async {
  final DateTime now = DateTime.now();
  final DateTime experieddate = now.add(Duration(days: 7)); 

  final formattedDate = DateFormat('yyyy-MM-dd').format(experieddate);
  expireddate.value = formattedDate;
}

  //   if (picked != null) {
  //     final experieddate = picked.add(Duration(days: 7));
  //     final formattedDate = DateFormat('yyyy-MM-dd').format(experieddate);
  //     expireddate.value = formattedDate;
  //   }
  //  }

  void submitForm() {
    print(
        'Data : $fullname, $placeofbirth, $dateofbirth, $gender, $email, $nationality, $membership, $cardnumber, $expireddate, $payment');
    isFormSubmitted.value = true;
  }
}
