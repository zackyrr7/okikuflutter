import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okiku/modules/history/model/history_model.dart';
import 'package:okiku/modules/history/services/history_service.dart';
import 'package:intl/intl.dart';

class HistoryController extends GetxController {
  var isLoading = false.obs;
  final HistoryService _historyService = HistoryService();
  var historyData = <HistoryModel>[].obs;
  var expandedItems = <int, bool>{}.obs;

  var month = DateTime.now().month.obs;
  var monthDis = DateFormat('MMMM').format(DateTime.now()).obs;
  RxInt selectedMonth = 0.obs;

  void toggleExpand(int index) {
    expandedItems[index] = !(expandedItems[index] ?? false);
  }

  bool isExpanded(int index) {
    return expandedItems[index] ?? false;
  }

  Future<void> pickMonth(BuildContext context) async {
    final List<String> months = List.generate(
      12,
      (index) => DateFormat('MMMM').format(DateTime(0, index + 1)),
    );

    final String? picked = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pilih Bulan'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: months.length,
              itemBuilder: (context, index) {
                final month = months[index];
                return ListTile(
                  title: Text(month),
                  onTap: () => Navigator.pop(context, month),
                );
              },
            ),
          ),
        );
      },
    );

    if (picked != null) {
      monthDis.value = picked;
      month.value = months.indexOf(picked) + 1;
      getHistory();
    }
  }

  Future<void> getHistory() async {
    isLoading.value = true;
    try {
      final result = await _historyService.getHistory(month.value);

      if (result['status'] == true) {
        final dataList = result['data']['data'] as List<dynamic>;
        historyData.value = HistoryModel.fromJsonList(dataList);
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHistory();
  }
}
