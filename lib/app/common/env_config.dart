class EnvironmentConfig {
  ///
  /// flutter run --dart-define=APP_CHANNEL=HUAWEI --dart-define=APP_VERSION=1.0.0
  ///
  static const appChannel = String.fromEnvironment('APP_CHANNEL', defaultValue: 'UNKNOWN');
  static const appVersion = String.fromEnvironment('APP_VERSION', defaultValue: '1.0.0');
}