// pasien_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/data/kategori_model.dart';
import 'package:learn_getx/app/modules/kategori/controllers/kategori_controller.dart';

class KategoriView extends StatelessWidget {
  final KategoriController controller = Get.put(KategoriController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kategori'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed('/tambah-kategori');
            },
          ),
        ],
      ),
      // body: Obx(
      //   () => controller.kategoriList.isEmpty
      //       ? Center(child: CircularProgressIndicator())
      //       : ListView.builder(
      //           itemCount: controller.kategoriList.length,
      //           itemBuilder: (context, index) {
      //             var kategori = controller.kategoriList[index];
      //             return ListTile(
      //               title: Row(
      //                 children: [
      //                   Expanded(
      //                     child: Text(kategori.nama),
      //                   ),
      //                   IconButton(
      //                     icon: Icon(Icons.edit),
      //                     onPressed: () {
      //                       Get.to(() => EditKategoriView(kategori: kategori));
      //                     },
      //                   ),
      //                   IconButton(
      //                     icon: Icon(Icons.visibility),
      //                     onPressed: () {
      //                       Get.to(() => DetailKategoriView(kategori: kategori));
      //                     },
      //                   ),
      //                   IconButton(
      //                     icon: Icon(Icons.delete),
      //                     onPressed: () {
      //                       // Show a confirmation dialog before deleting
      //                       showDeleteConfirmation(context, kategori);
      //                     },
      //                   ),
      //                 ],
      //               ),
      //             );
      //           },
      //         ),
      // ),
    );
  }

//   void showDeleteConfirmation(BuildContext context, Kategori kategori) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Delete Kategori'),
//           content: Text('Are you sure you want to delete ${kategori.nama}?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 // Call the deletePasien method from the controller
//                 controller.deleteKategori(kategori);
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('Delete'),
//             ),
//           ],
//         );
//       },
//     );
//   }
}