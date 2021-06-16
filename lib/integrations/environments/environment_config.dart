abstract class EnvironmentConfig {

  static const String baseUrl = String.fromEnvironment(
    'ENV_BASE_URL',
    defaultValue: '...',
  );
 
}
