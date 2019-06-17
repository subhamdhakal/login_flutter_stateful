class ValidatorMixin {
  String emailValidator(String value) {
    if (!value.contains('@')) {
      return "Enter valid email address";
    }
    return null;
  }

  String passwordValidator(String value) {
    if (value.length < 4) {
      return "Password too short";
    }
    return null;
  }
}
