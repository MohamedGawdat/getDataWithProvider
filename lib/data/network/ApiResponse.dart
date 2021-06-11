class ApiResponse {
  int? statusCode;
  Map<String, dynamic>? data;
  bool isSuccess;
  String? message;

  ApiResponse({required this.statusCode, this.data,required this.isSuccess, this.message});
}
