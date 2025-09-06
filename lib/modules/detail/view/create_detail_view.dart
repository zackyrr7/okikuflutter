import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/detail/controller/detailUserController.dart';
import 'package:okiku/themes/app_color.dart';

class CreateDetailView extends StatelessWidget {
  CreateDetailView({super.key});
  final DetailUserController detailusercontroller = Get.put(
    DetailUserController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Get.height * 0.1),
            Row(
              children: [
                Image.asset('assets/logo/kikukuning.png', height: 100),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hai, Humans!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Yuk kenalan dulu. Aku sih kiku, kamu siapa?',
                        softWrap: true,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            TextFormField(
              readOnly: true,
              controller: detailusercontroller.ttlController,
              onTap: () {
                detailusercontroller.pickDate(context);
              },
              // controller: ,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Tanggal Lahir',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.calendar_month, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.amberAccent),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              onTap: () {
                detailusercontroller.pickGender();
              },
              controller: detailusercontroller.genderController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Gender',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.wc, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.amberAccent),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: detailusercontroller.pekerjaanController,
              onTap: () {
                detailusercontroller.pickPekerjaan();
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Pekerjaan',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.work, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.amberAccent),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                detailusercontroller.simpanDetail();
              },
              child:
                  detailusercontroller.isLoading.value
                      ? SingleChildScrollView()
                      : Text("Simpan"),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: Colors.grey[200],
            //   ),
            //   width: Get.width * 0.3,
            //   height: Get.height * 0.08,

            //   child: Row(
            //     children: [
            //       Image.asset(
            //         'assets/icons/paw.png',
            //         height: Get.height * 0.05,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
