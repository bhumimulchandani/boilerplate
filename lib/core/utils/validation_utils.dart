class ValidationUtils {
  static String? isNotEmpty(String? value) {
    if (value != null && value.trim().isNotEmpty) {
      return null;
    }
    return "Field is required";
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
    if (emailRegex.hasMatch(value)) {
      return null;
    } else {
      return "Email format is invalid";
    }
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    final passwordRegex = RegExp(
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');
    if (passwordRegex.hasMatch(value)) {
      return null;
    } else {
      return "Password must contain at least 8 characters, includes upper/lowercase, number, and special character";
    }
  }
}
