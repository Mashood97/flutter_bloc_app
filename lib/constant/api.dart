class ApiConfiguration {
  static final ApiConfiguration _singleton = ApiConfiguration._internal();

  factory ApiConfiguration() {
    return _singleton;
  }

  ApiConfiguration._internal();

  String kBaseUrl = "";
}
