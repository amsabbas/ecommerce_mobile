
enum HttpMethod { get, post, patch, delete }

enum HttpType { raw, formData }

//ignore: must_be_immutable
class EndPoint  {
  final String endpoint;
  Map<String, dynamic>? headers;
  final Map<String, dynamic>? data;
  final String? userToken;
  final HttpMethod method;
  HttpType? type = HttpType.raw;

  EndPoint({
    required this.endpoint,
    this.headers,
    this.data,
    this.userToken,
    this.type,
    required this.method,
  }) {
    headers ??= {};
    if (userToken != null) {
      headers!["Authorization"] = 'Bearer $userToken';
    }
  }

}

extension ParseToString on HttpMethod {
  String toShortString() {
    return toString().split('.').last;
  }
}
