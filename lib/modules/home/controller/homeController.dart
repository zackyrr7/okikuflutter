import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/home/model/jurnal_model.dart';
import 'package:okiku/modules/home/model/streak_model.dart';
import 'package:okiku/modules/home/services/dashboard_services.dart';

class Homecontroller extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    namaMood();
    streak();
    jurnalDashboard();
  }

  final storage = FlutterSecureStorage();
  var isLoading = false.obs;
  final _dashboardServices = DashboardServices();
  var nama = ''.obs;
  var mood = ''.obs;
  var streakData = Rxn<StreakWeek>();
  var jurnalData = <JurnalModel>[].obs;

  Future<void> logout() async {
    storage.deleteAll();
    Get.offAndToNamed('/login');
  }

  Future<void> namaMood() async {
    isLoading.value = true;
    try {
      final result = await _dashboardServices.namaMood();
      if (result['status'] == true) {
        final data = result['data']; // ambil isi data dari result
        nama.value = data['nama'] ?? ''; // gunakan null safety
        mood.value = data['mood'] ?? '';
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

  Future<void> streak() async {
    isLoading.value = true;
    try {
      final result = await _dashboardServices.streak();
      if (result['status'] == true) {
        streakData.value = StreakWeek.fromJson(result['data']);
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
        'Terjadi kesalahan Server',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> jurnalDashboard() async {
    isLoading.value = true;
    try {
      final result = await _dashboardServices.jurnalDashboard();
      if (result['status'] == true) {
        final response = JurnalResponse.fromJson(result['data']);
        jurnalData.assignAll(response.jurnal);
      } else {
        Get.snackbar(
          'Gagal',
          result['message'] ?? 'Terjadi kesalahan',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print(e);
      Get.snackbar(
        'Gagal',
        'Terjadi kesalahan Server',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
