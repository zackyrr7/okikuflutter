class StreakWeek {
  final int streaks;
  final List<StreakDay> result;

  StreakWeek({
    required this.streaks,
    required this.result,
  });

  factory StreakWeek.fromJson(Map<String, dynamic> json) {
    return StreakWeek(
      streaks: json['streaks'] ?? 0,
      result: (json['result'] as List<dynamic>)
          .map((e) => StreakDay.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'streaks': streaks,
      'result': result.map((e) => e.toJson()).toList(),
    };
  }
}

class StreakDay {
  final int hariKe;
  final String namaHari;
  final int id;
  final String? tanggal;
  final int streak;

  StreakDay({
    required this.hariKe,
    required this.namaHari,
    required this.id,
    this.tanggal,
    required this.streak,
  });

  factory StreakDay.fromJson(Map<String, dynamic> json) {
    return StreakDay(
      hariKe: json['hari_ke'] ?? 0,
      namaHari: json['nama_hari'] ?? '',
      id: json['id'] ?? 0,
      tanggal: json['tanggal'],
      streak: json['streak'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hari_ke': hariKe,
      'nama_hari': namaHari,
      'id': id,
      'tanggal': tanggal,
      'streak': streak,
    };
  }
}
