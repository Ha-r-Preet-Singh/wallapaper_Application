import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/app_exceptions.dart';

class ApiHelper {
  Future<dynamic>? getApi(String url, {Map<String, String>? mHeaders}) async {
    Uri mUrl = Uri.parse(url);
    try {
      var res = await http.get(mUrl,
          headers: mHeaders ??
              {
                "Authorization":
                    " ccEI7ea5vTWvcypWjTBtmnSVnyGSW9pUpX910XJEbYsJI0We4U08zfRt",
              });

      return returnMyResponse(res);
    } catch (e) {}
  }

  dynamic returnMyResponse(http.Response res) {
    switch (res.statusCode) {
      case 200:
        var mData = jsonDecode(res.body);
        print(mData);
        return mData;

      case 400:
        throw BadRequestException(mBody: res.body);

      case 401:
      case 403:
      case 407:
        throw UnAuthorisedException(mBody: res.body);

      case 500:
      default:
        throw ServerException(mBody: res.body);
    }
  }
}
