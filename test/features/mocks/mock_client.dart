import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements Client {
  @override
  Future<Response> get(Uri? url, {Map<String, String>? headers}) {
    return super.noSuchMethod(
      Invocation.method(
        #get,
        [url],
        {
          #headers: headers,
        },
      ),
      returnValue: Future.value(Response('', 200)),
      returnValueForMissingStub: Future.value(Response('', 200)),
    );
  }
}
