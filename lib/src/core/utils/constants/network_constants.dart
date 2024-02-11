import 'package:flutter_clean_architecture/src/core/exports.dart';

class NetworkConstants {
  static const Map<AppEnvironment, String> _baseUrls = {
    AppEnvironment.ngrok: 'https://www.google.com',
    AppEnvironment.dev: apiUrl,
    AppEnvironment.qa: 'https://www.google.com',
    AppEnvironment.prod: 'https://www.google.com',
    AppEnvironment.uat: 'https://www.google.com',
  };
  static const AppEnvironment _appEnvironment = AppEnvironment.dev;
  static getBaseUrl() => _baseUrls[_appEnvironment] ?? '';

  static const String apiUrl =
      'http://api.nytimes.com/svc/mostpopular/v2/mostviewed/';
  static const String apiKey = 'WiRqmPm4mBO4ssOsQL7uWDS0lJO4KviJ';

 static String getApiKeyPath() {
    return '?api-key=$apiKey';
  }

 static String getArticlePath(int period) {
    return 'all-sections/${period.toString()}.json${getApiKeyPath()}';
  }
}
