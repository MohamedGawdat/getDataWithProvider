import 'package:dio/dio.dart';
import 'ApiResponse.dart';

class BaseResponse {
  Map<String, dynamic>? result;

  BaseResponse({
    this.result,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        result: json ,
      );

  static ApiResponse extractResponse(Response<dynamic>? httpResponse) {
    final BaseResponse baseResponse =
        BaseResponse.fromJson(httpResponse?.data as Map<String, dynamic>);

    if (baseResponse.result?['errors'] != null) {
      // api send error to webservice caller.
      final StringBuffer apiError = StringBuffer();
      final errors = baseResponse.result?['errors'] as List<dynamic>;
      errors.forEach((element) {
        apiError.write(element['msg']);
        apiError.write("\n");
      });

      return new ApiResponse(
          statusCode: httpResponse?.statusCode,
          isSuccess: false,
          message: apiError.toString());
    } else {
      // server response data from webservice call.
      return new ApiResponse(
          statusCode: httpResponse?.statusCode,
          data: baseResponse.result,
          isSuccess: true);
    }
  }
}
