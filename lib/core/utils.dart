import 'package:intl/intl.dart';

final dobFormat = DateFormat('MM/dd/yyyy'); //.format(date).toString();

bool isValidEmail(String email) => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    .hasMatch(email);
