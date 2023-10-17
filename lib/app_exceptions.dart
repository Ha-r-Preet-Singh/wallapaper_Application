class AppExceptions implements Exception {
  String title;
  String body;

  AppExceptions({required this.title, required this.body});

  String formattedError() {
    return "$title : $body";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException({required String mBody})
      : super(title: "Data Communication Error", body: mBody);
}

class UnAuthorisedException extends AppExceptions {
  UnAuthorisedException({required String mBody})
      : super(title: "UnAuthorised Access Error", body: mBody);
}

class InValidInputException extends AppExceptions {
  InValidInputException({required String mBody})
      : super(title: "UnAuthorised Error", body: mBody);
}

class BadRequestException extends AppExceptions {
  BadRequestException({required String mBody})
      : super(title: "BadRequest Error", body: mBody);
}

class ServerException extends AppExceptions {
  ServerException({required String mBody})
      : super(title: "Server Error", body: mBody);
}
