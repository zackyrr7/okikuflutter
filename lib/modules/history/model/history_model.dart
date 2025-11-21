import 'package:intl/intl.dart';

class HistoryModel {
  final String line;
  final String respon;
  final String date;
  final String emotion;
  final String deskripsi;

  HistoryModel({required this.emotion, required this.deskripsi, required this.line, required this.respon, required this.date});

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      line: json['line'] ?? '',
      emotion: json['emotion'] ?? '',
      respon: json['respon'] ?? '',
      date: json['date'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
    );
  }

  static List<HistoryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => HistoryModel.fromJson(item)).toList();
  }

  /// Helper: ubah string tanggal ke DateTime
  DateTime get parsedDate {
    try {
      return DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);
    } catch (_) {
      return DateTime.now();
    }
  }

  /// Dapatkan hari (contoh: Mon, Tue, Wed)
  String get dayShort => DateFormat('E').format(parsedDate);

  /// Dapatkan nama hari penuh (contoh: Monday, Tuesday)
  String get dayFull => DateFormat('EEEE').format(parsedDate);

  /// Dapatkan tanggal & bulan pendek (contoh: 04 Oct)
  String get dateShort => DateFormat('dd MMM').format(parsedDate);

  /// Dapatkan tanggal & bulan dalam bahasa Indonesia (contoh: 04 Oktober)
  String get dateIndo {
    // Ganti locale ke ID jika sudah set di project
    return DateFormat('dd MMMM', 'id_ID').format(parsedDate);
  }

  /// Dapatkan tanggal lengkap (contoh: Senin, 04 Oktober 2025)
  String get fullDateIndo {
    return DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(parsedDate);
  }
}

// class HistoryResponse {
//   final bool status;
//   final String message;
//   final List<HistoryModel> jurnal;

//   HistoryResponse({
//     required this.status,
//     required this.message,
//     required this.jurnal,
//   });

//   factory HistoryResponse.fromJson(Map<String, dynamic> json) {
//     return HistoryResponse(
//       status: json['status'] ?? false,
//       message: json['message'] ?? '',
//       jurnal: HistoryModel.fromJsonList(json['jurnal'] ?? []),
//     );
//   }
// }
