abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? quearyParams,
    dynamic data,
  });

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? quearyParams,
    dynamic data,
    bool isFormData = false,
  });

  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? quearyParams,
    dynamic data,
    bool isFormData = false,
  });

  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? quearyParams,
    dynamic data,
    bool isFormData = false,
  });
}
