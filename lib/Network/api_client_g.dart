part of 'api_client.dart';

class _ApiClient implements ApiClient {
  _ApiClient(
    this._dio,
  );

  final Dio _dio;

  @override
  Future getRequest({required String apiUrl}) async {
    var response = await _dio
        .get(
      apiUrl,
      options: Options(headers: {
        'accept': '*/*',
      }),
    )
        .whenComplete(() {
      debugPrint("Getting Process is Complete:");
    }).catchError((error) async {
      if (error is SocketException) {
        ShowMessage.onFail("No internet connection!");
      } else {
        int result = await ServerError.withError(error: error).getErrorCode();
        if (result >= 400) {
          ShowMessage.onFail(error.response!.data["message"].toString());
        } else {
          ShowMessage.onFail(
              ServerError.withError(error: error).getErrorMessage().toString());
        }
      }
    });

    return response;
  }

  @override
  Future getRequestHeader(
      {required String apiUrl, required String token}) async {
    Response response;
    response = await _dio
        .get(
      apiUrl,
      options: Options(headers: {
        "Accept": '*/*',
        "Authorization": "Bearer ${token.toString()}",
      }),
    )
        .whenComplete(() {
      debugPrint("Getting Process is Complete:");
    }).catchError((error) async {
      if (error is SocketException) {
        ShowMessage.onFail("No internet connection!");
      } else {
        int result = await ServerError.withError(error: error).getErrorCode();
        if (result == 401) {
          ShowMessage.onFail("Un autherized");
        } else if (result == 400) {
          ShowMessage.onFail(error.response!.data["message"].toString());
        } else {
          ShowMessage.onFail(
              ServerError.withError(error: error).getErrorMessage().toString());
        }
      }
    });

    return response;
  }
}
