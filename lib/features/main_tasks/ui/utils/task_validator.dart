class Validators {
  static bool taskValidator(String? value) {
    if (value == '' || value == null || value.contains('\n')) {
      return false;
    }
    return true;
  }
}
