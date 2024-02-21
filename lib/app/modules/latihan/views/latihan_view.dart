import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/latihan/controllers/latihan_controller.dart';
import 'package:intl/intl.dart';
import 'package:learn_getx/app/modules/latihan/views/outputlatihan_view.dart';

class Latihan extends StatelessWidget {
  Latihan({Key? key}) : super(key: key);

  final LatihanController latihanController = Get.put(LatihanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'A. Personal Information',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Fullname'),
                      onChanged: (value) =>
                          latihanController.fullname.value = value,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Place of Birth'),
                      onChanged: (value) =>
                          latihanController.placeofbirth.value = value,
                    ),
                    SizedBox(height: 16.0),
                    InkWell(
                      onTap: () => latihanController.selectbirthDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          hintText: 'Select Date',
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Date of Birth:'),
                            Obx(() => Text(
                                latihanController.selectedbirthDate.value)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text("Gender"),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: 'Male',
                              groupValue: latihanController.gender.value,
                              onChanged: (value) =>
                                  latihanController.gender.value = value!,
                            )),
                        Text('Male'),
                        Obx(() => Radio(
                              value: 'Female',
                              groupValue: latihanController.gender.value,
                              onChanged: (value) =>
                                  latihanController.gender.value = value!,
                            )),
                        Text('Female'),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      onChanged: (value) =>
                          latihanController.email.value = value,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nationality'),
                      onChanged: (value) =>
                          latihanController.nationality.value = value,
                    ),
                    SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'B. Type of Membership',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Obx(() => Radio(
                                      value: 'Reguler',
                                      groupValue:
                                          latihanController.membership.value,
                                      onChanged: (value) => latihanController
                                          .togglemembership(value!),
                                    )),
                                Text("Reguler"),
                                Row(
                                  children: [
                                    Obx(() => Radio(
                                          value: 'Gold',
                                          groupValue: latihanController
                                              .membership.value,
                                          onChanged: (value) =>
                                              latihanController
                                                  .togglemembership(value!),
                                        )),
                                    Text("Gold"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Obx(() => Radio(
                                          value: 'Platinum',
                                          groupValue: latihanController
                                              .membership.value,
                                          onChanged: (value) =>
                                              latihanController
                                                  .togglemembership(value!),
                                        )),
                                    Text("Platinum"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Obx(() => Radio(
                                          value: 'VIP',
                                          groupValue: latihanController
                                              .membership.value,
                                          onChanged: (value) =>
                                              latihanController
                                                  .togglemembership(value!),
                                        )),
                                    Text("VIP"),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'C. Payment Details',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Card Number'),
                          onChanged: (value) =>
                              latihanController.cardnumber.value = value,
                        ),
                        SizedBox(height: 16.0),
                        InkWell(
                          onTap: () =>
                              latihanController.selectExpiredDate(context),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              hintText: 'Pilih Tanggal',
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Expired Date: '),
                                Obx(() =>
                                    Text(latihanController.expireddate.value)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () => Get.to(OutputLatihan()),
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 16.0),
              // Obx(() {
              //   if (latihanController.isFormSubmitted.value) {
              //     return Text(
              //       'Output: ${latihanController.fullname}, ${latihanController.placeofbirth}, ${latihanController.calculateAge()}, ${latihanController.gender}, ${latihanController.email}, ${latihanController.nationality}, ${latihanController.membership}, ${latihanController.cardnumber}, ${latihanController.expireddate}, ${latihanController.payment}',
              //       style: TextStyle(fontSize: 16.0),
              //     );
              //   } else {
              //     return SizedBox.shrink();
              //   }
              // }),
            ],
          ),
        ),
      ),
    );
  }
}
