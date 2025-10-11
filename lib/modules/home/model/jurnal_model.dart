import 'package:intl/intl.dart';

class JurnalModel {
  final String emotion;
  final String line;
  final String respon;
  final String date;

  JurnalModel({
    required this.emotion,
    required this.line,
    required this.respon,
    required this.date,
  });

  factory JurnalModel.fromJson(Map<String, dynamic> json) {
    return JurnalModel(
      emotion: json['emotion'] ?? '',
      line: json['line'] ?? '',
      respon: json['respon'] ?? '',
      date: json['date'] ?? '',
    );
  }

  static List<JurnalModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => JurnalModel.fromJson(item)).toList();
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

class JurnalResponse {
  final bool status;
  final String message;
  final List<JurnalModel> jurnal;

  JurnalResponse({
    required this.status,
    required this.message,
    required this.jurnal,
  });

  factory JurnalResponse.fromJson(Map<String, dynamic> json) {
    return JurnalResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      jurnal: JurnalModel.fromJsonList(json['jurnal'] ?? []),
    );
  }
}
