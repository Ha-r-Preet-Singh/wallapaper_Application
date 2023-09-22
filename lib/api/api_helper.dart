import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {



  Future<dynamic>? getApi(String url, {Map<String, String>? mHeaders}) async {
    Uri mUrl = Uri.parse(url);
    var res = await http.get(mUrl,
        headers: mHeaders ??
            {
              "Authorization":
                  " ccEI7ea5vTWvcypWjTBtmnSVnyGSW9pUpX910XJEbYsJI0We4U08zfRt",
            });


    if(res.statusCode ==200){
      return jsonDecode(res.body);
    }else{
      return null;
    }
  }
}
