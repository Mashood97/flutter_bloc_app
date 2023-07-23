class ApiConfiguration {
  static final ApiConfiguration _singleton = ApiConfiguration._internal();

  factory ApiConfiguration() {
    return _singleton;
  }

  ApiConfiguration._internal();

  static const String kBaseUrl = "https://newsapi.org/v2";
  static const String apiKey = "cea0a34c98dd40769115e7807924d81f";

  static const String getPosts = "/posts";
  static const String getTopHeadlines = "/top-headlines";
}
