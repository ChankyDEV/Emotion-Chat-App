import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class MockDio extends Mock implements Dio {
  @override
  Future<Response<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return super.noSuchMethod(
      Invocation.method(#post, [
        path
      ], {
        #data: data,
        #queryParameters: queryParameters,
        #options: options,
        #cancelToken: cancelToken,
        #onSendProgress: onSendProgress,
        #onReceiveProgress: onReceiveProgress,
      }),
      returnValue:
          Future.value(Response(requestOptions: RequestOptions(path: path))),
      returnValueForMissingStub:
          Future.value(Response(requestOptions: RequestOptions(path: path))),
    );
  }
}
