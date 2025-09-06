import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/helper/helper.dart';
import 'package:okiku/modules/detail/services/detail_user_services.dart';
import 'package:okiku/themes/app_color.dart';

class DetailUserController extends GetxController {
  var isLoading = false.obs;
  final ttlController = TextEditingController();
  final genderController = TextEditingController();
  final pekerjaanController = TextEditingController();
  final _detailService = DetailUserServices();

  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
      locale: const Locale("id", "ID"),
    );
    if (pickedDate != null) {
      ttlController.text = Helper().dateFormat(pickedDate);
    }
  }

  final List<Map<String, dynamic>> gender = [
    {'label': 'Laki - Laki', 'icon': Icons.male},
    {'label': 'Perempuan', 'icon': Icons.female},
    {'label': 'Kucing', 'icon': Icons.pets},
  ];

  final List<Map<String, dynamic>> pekerjaanList = [
    {'label': 'Pelajar', 'icon': Icons.school},
    {'label': 'Mahasiswa', 'icon': Icons.school_outlined},
    {'label': 'Karyawan Swasta', 'icon': Icons.business_center},
    {'label': 'Pegawai Negeri', 'icon': Icons.account_balance},
    {'label': 'Freelancer', 'icon': Icons.laptop_mac},
    {'label': 'Wirausaha', 'icon': Icons.storefront},
    {'label': 'Ibu Rumah Tangga', 'icon': Icons.home_filled},
    {'label': 'Pengangguran Ceria', 'icon': Icons.weekend},
    {'label': 'Content Creator', 'icon': Icons.videocam},
    {'label': 'Guru / Dosen', 'icon': Icons.menu_book},
    {'label': 'Dokter', 'icon': Icons.local_hospital},
    {'label': 'Seniman', 'icon': Icons.brush},
    {'label': 'Penulis', 'icon': Icons.edit},
    {'label': 'Programmer Overthinking', 'icon': Icons.code},
    {'label': 'Desainer Visual', 'icon': Icons.palette},
    {'label': 'Petugas Lapangan', 'icon': Icons.directions_walk},
    {'label': 'Customer Service', 'icon': Icons.headset_mic},
    {'label': 'Marketing Ninja', 'icon': Icons.campaign},
    {'label': 'Analis Data', 'icon': Icons.bar_chart},
    {'label': 'Barista Penuh Harapan', 'icon': Icons.coffee},
    {'label': 'Petani Digital', 'icon': Icons.agriculture},
    {'label': 'Manajer Lelah', 'icon': Icons.manage_accounts},
    {'label': 'Karyawan Kontrak Kehidupan', 'icon': Icons.timelapse},
    {'label': 'Kucing Profesional', 'icon': Icons.pets},
  ];

  Future<void> pickGender() async {
    final result = await Get.dialog<String>(
      AlertDialog(
        title: Text("Pilih Gender mu"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...gender.map((item) {
              return ListTile(
                leading: Icon(item['icon']),
                title: Text(item['label']),
                onTap: () {
                  if (item['label'] != 'Kucing') {
                    Get.back(result: item['label']);
                    genderController.text = item['label'];
                  } else {
                    Get.dialog(
                      AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/logo/kikukuning.png',
                                  height: 50,
                                ),
                                Text(
                                  'Aku yang kucing, bukan kamu',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('Oke'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Future<void> pickPekerjaan() async {
    final result = await Get.dialog<String>(
      AlertDialog(
        title: Container(
          color: Colors.white,
          child: Text(
            "Pilih Pekerjaan mu",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...pekerjaanList.map((item) {
                return ListTile(
                  onTap: () {
                    Get.back(result: item['label']);
                    pekerjaanController.text = item['label'];
                  },
                  title: Text(item['label']),
                  leading: Icon(item['icon']),
                  shape: Border(
                    bottom: BorderSide(color: AppColor.accentOlive),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> simpanDetail() async {
    final ttl = ttlController.text;
    final gender = genderController.text;
    final pekerjaan = pekerjaanController.text;
    isLoading.value = true;

    try {
      if (ttl.isEmpty || gender.isEmpty || pekerjaan.isEmpty) {
        Get.snackbar('Error', 'Isi Semua data terlebih dahulu');
        return;
      }
      var result = await _detailService.simpanDetail(ttl, gender, pekerjaan);

      if (result['status'] == true) {
        Get.snackbar('Berhasil', 'Data Kamu berhasil di simpan');
        Get.offAndToNamed('/home');
      } else {
        Get.snackbar(
          'Gagal',
          result['message'] ?? 'Terjadi kesalahan',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
