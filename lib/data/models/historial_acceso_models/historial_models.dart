class HistorialAccesoResponse {
  final HistorialAccesoStats stats;
  final List<HistorialAccesoItem> history;

  const HistorialAccesoResponse({
    required this.stats,
    required this.history,
  });

  static HistorialAccesoResponse fromJson(Map<String, dynamic> json) {
    return HistorialAccesoResponse(
      stats: HistorialAccesoStats.fromJson(json['stats'] as Map<String, dynamic>),
      history: (json['history']['data'] as List).map((item) => HistorialAccesoItem.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}

class HistorialAccesoStats {
  final int activeSessions;
  final int failedAttemptsToday;
  final String lastLoginTime;

  const HistorialAccesoStats({
    required this.activeSessions,
    required this.failedAttemptsToday,
    required this.lastLoginTime,
  });

  static HistorialAccesoStats fromJson(Map<String, dynamic> json) {
    return HistorialAccesoStats(
      activeSessions: json['activeSessions'] as int, 
      failedAttemptsToday: json['failedAttemptsToday'] as int, 
      lastLoginTime: json['lastLoginTime'] as String,
    );
  }
}

class HistorialAccesoItem {
  final String userName; 
  final String rol;
  final String device;
  final String ip;
  final String date;
  final String status;

  const HistorialAccesoItem({
    required this.userName,
    required this.rol,
    required this.device,
    required this.ip,
    required this.date,
    required this.status,
  });

  static HistorialAccesoItem fromJson(Map<String, dynamic> json) {
    return HistorialAccesoItem(
      userName: json['userName'] as String, 
      rol: json['rol'] as String,
      device: json['device'] as String,
      ip: json['ip'] as String,
      date: json['date'] as String,
      status: json['status'] as String,
    );
  }
}