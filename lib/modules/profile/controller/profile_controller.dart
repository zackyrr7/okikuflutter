import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:okiku/modules/home/controller/homeController.dart';
import 'package:okiku/modules/profile/services/profile_services.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var file = Rxn<File>();
  final ImagePicker picker = ImagePicker();
  var source = ''.obs;
  var PickedFile;
  final ProfileServices _profileServices = ProfileServices();
  final Homecontroller homecontroller = Get.find<Homecontroller>();
  var email = ''.obs;

  Future<void> takePhoto() async {
    try {
      var statusCamera = await Permission.camera.status;
      var statusGaleri = await Permission.storage.status;

      if (statusCamera.isDenied) {
        await Permission.camera.request();
      } else if (statusCamera.isPermanentlyDenied) {
        Get.defaultDialog(
          title: "Izin Kamera Ditolak",
          middleText:
              "Kamera diblokir permanen. Silakan buka pengaturan untuk mengizinkannya.",
          textConfirm: "Buka Pengaturan",
          textCancel: "Tutup",
          onConfirm: () => openAppSettings(),
        );
      }

      if (statusGaleri.isDenied) {
        await Permission.storage.request();
      } else if (statusCamera.isPermanentlyDenied) {
        Get.defaultDialog(
          title: "Izin Galeri Ditolak",
          middleText:
              "Galeri diblokir permanen. Silakan buka pengaturan untuk mengizinkannya.",
          textConfirm: "Buka Pengaturan",
          textCancel: "Tutup",
          onConfirm: () => openAppSettings(),
        );
      }

      XFile? pickedFile;
      if (source.value == 'camera') {
        pickedFile = await picker.pickImage(
          source: ImageSource.camera,
          maxWidth: 800,
          imageQuality: 85,
        );
      } else {
        pickedFile = await picker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 800,
          imageQuality: 85,
        );
      }
      if (pickedFile != null) {
        file.value = File(pickedFile.path);
        var result = await _profileServices.updateFoto(file.value);
        if (result['status'] == true) {
          homecontroller.detailUser();
        }
      }
    } catch (e) {
      print("❌ Error takePhoto: $e");
      Get.snackbar(
        "Gagal mengambil foto",
        "Terjadi kesalahan.\n$e",
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> cekEmail() async {
    isLoading.value = true;
    try {
      final result = await _profileServices.dataEmail();
      if (result['status'] == true) {
        final data = result['data']; // ambil isi data dari result
      email.value = data['email'];

      } else {
        Get.snackbar(
          'Gagal',
          result['message'] ?? 'Terjadi kesalahan',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Gagal',
        'Terjadi kesalahan Serverrr',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cekEmail();
    super.onInit();
  }
}
