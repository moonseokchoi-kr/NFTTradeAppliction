import 'dart:convert';

ServiceError signInErrorFromJson(String str) =>
    ServiceError.fromJson(json.decode(str));

String signInErrorToJson(ServiceError data) => json.encode(data.toJson());

class ServiceError {
  ServiceError({
    required this.timestamp,
    required this.error,
    required this.path,
  });

  DateTime timestamp;
  String error;
  String path;

  factory ServiceError.fromJson(Map<String, dynamic> json) => ServiceError(
        timestamp: DateTime.parse(json["timestamp"]),
        error: json["error"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "error": error,
        "path": path,
      };
}
