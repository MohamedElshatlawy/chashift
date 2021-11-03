class Validation {
  //"^5(\\d{8})\$"
  static bool isValidPhone(String phone) =>
      RegExp("^5(\\d{8})\$").hasMatch(phone);

  static bool isEmailValid(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
