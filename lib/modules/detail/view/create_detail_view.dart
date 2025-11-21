import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/detail/controller/detailUserController.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/themes/app_color.dart';

class CreateDetailView extends StatelessWidget {
  CreateDetailView({super.key});
  final DetailUserController detailusercontroller = Get.put(
    DetailUserController(),
  );
  final Homecontroller homeController = Get.find<Homecontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      appBar: AppBar(backgroundColor: AppColor.backgroundCream),
      body: Container(
        color: AppColor.backgroundCream,
        child: SafeArea(
          child: GestureDetector(
            onTap:
                () =>
                    FocusScope.of(
                      context,
                    ).unfocus(), // 👉 Tutup keyboard saat tap di luar
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.width,
                          height: Get.height * 0.25,
                          child: Image.asset(
                            'assets/logo/Logo3.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Sapaan
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hi ',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColor.textDark,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${homeController.nama.value}',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColor.primaryYellow,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ', kenalan dulu yuk?',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColor.textDark,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: TextFormField(
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
                              prefixIcon: Icon(
                                Icons.calendar_month,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.blueGrey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.amberAccent,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: TextFormField(
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
                                borderSide: BorderSide(
                                  color: Colors.amberAccent,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: TextFormField(
                            controller:
                                detailusercontroller.pekerjaanController,
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
                                borderSide: BorderSide(
                                  color: Colors.amberAccent,
                                ),
                              ),
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
                      ],
                    ),
                  ),
                ),

                // Input Text (pindahkan ke bawah agar otomatis naik saat keyboard muncul)
              ],
            ),
          ),
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     // mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SizedBox(height: Get.height * 0.1),
      //       Row(
      //         children: [
      //           Image.asset('assets/logo/kikukuning.png', height: 100),
      //           Expanded(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   'Hai, Humans!',
      //                   style: TextStyle(
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                 ),
      //                 Text(
      //                   'Yuk kenalan dulu. Aku sih kiku, kamu siapa?',
      //                   softWrap: true,
      //                   style: TextStyle(fontSize: 16),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),

      //       TextFormField(
      //         readOnly: true,
      //         controller: detailusercontroller.ttlController,
      //         onTap: () {
      //           detailusercontroller.pickDate(context);
      //         },
      //         // controller: ,
      //         decoration: InputDecoration(
      //           filled: true,
      //           fillColor: Colors.white,
      //           labelText: 'Tanggal Lahir',
      //           labelStyle: TextStyle(color: Colors.black),
      //           prefixIcon: Icon(Icons.calendar_month, color: Colors.black),
      //           border: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           enabledBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(20),
      //             borderSide: BorderSide(color: Colors.blueGrey),
      //           ),
      //           focusedBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(20),
      //             borderSide: BorderSide(color: Colors.amberAccent),
      //           ),
      //         ),
      //       ),
      //       SizedBox(height: 20),
      //       TextFormField(
      //         onTap: () {
      //           detailusercontroller.pickGender();
      //         },
      //         controller: detailusercontroller.genderController,
      //         decoration: InputDecoration(
      //           filled: true,
      //           fillColor: Colors.white,
      //           labelText: 'Gender',
      //           labelStyle: TextStyle(color: Colors.black),
      //           prefixIcon: Icon(Icons.wc, color: Colors.black),
      //           border: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           enabledBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(20),
      //             borderSide: BorderSide(color: Colors.blueGrey),
      //           ),
      //           focusedBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(20),
      //             borderSide: BorderSide(color: Colors.amberAccent),
      //           ),
      //         ),
      //       ),
      //       SizedBox(height: 20),
      //       TextFormField(
      //         controller: detailusercontroller.pekerjaanController,
      //         onTap: () {
      //           detailusercontroller.pickPekerjaan();
      //         },
      //         decoration: InputDecoration(
      //           filled: true,
      //           fillColor: Colors.white,
      //           labelText: 'Pekerjaan',
      //           labelStyle: TextStyle(color: Colors.black),
      //           prefixIcon: Icon(Icons.work, color: Colors.black),
      //           border: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           enabledBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(20),
      //             borderSide: BorderSide(color: Colors.blueGrey),
      //           ),
      //           focusedBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(20),
      //             borderSide: BorderSide(color: Colors.amberAccent),
      //           ),
      //         ),
      //       ),
      //       SizedBox(height: 20),
      //       ElevatedButton(
      //         onPressed: () {
      //           detailusercontroller.simpanDetail();
      //         },
      //         child:
      //             detailusercontroller.isLoading.value
      //                 ? SingleChildScrollView()
      //                 : Text("Simpan"),
      //       ),
      //       // Container(
      //       //   decoration: BoxDecoration(
      //       //     borderRadius: BorderRadius.circular(10),
      //       //     color: Colors.grey[200],
      //       //   ),
      //       //   width: Get.width * 0.3,
      //       //   height: Get.height * 0.08,

      //       //   child: Row(
      //       //     children: [
      //       //       Image.asset(
      //       //         'assets/icons/paw.png',
      //       //         height: Get.height * 0.05,
      //       //       ),
      //       //     ],
      //       //   ),
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }
}
