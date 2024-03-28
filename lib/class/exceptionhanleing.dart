class ExceptionHandleing implements Exception {
  String? mess;
  ExceptionHandleing([this.mess]) {
    print(mess);
  }
}

class Internet extends ExceptionHandleing {
  Internet(v) : super(v);
}
