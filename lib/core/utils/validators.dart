/// Common validation utilities for form fields
class Validators {
  Validators._();

  /// Email validation regex pattern
  /// Matches standard email formats like: user@example.com
  static final RegExp emailRegex = RegExp(
    r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  /// Phone number validation regex pattern (Malaysian format)
  /// Matches formats like: +60 12-345 6789, 012-3456789, etc.
  static final RegExp phoneRegex = RegExp(
    r'^(\+?6?01)[0-46-9]-*[0-9]{7,8}$',
  );

  /// Validates if a string is a valid email address
  static bool isValidEmail(String? email) {
    if (email == null || email.trim().isEmpty) return true; // Optional field
    return emailRegex.hasMatch(email.trim());
  }

  /// Validates if a string is a valid phone number
  static bool isValidPhone(String? phone) {
    if (phone == null || phone.trim().isEmpty) return true; // Optional field
    return phoneRegex.hasMatch(phone.trim());
  }

  /// Validates if a year is within a valid range
  static bool isValidYear(int? year) {
    if (year == null) return true; // Optional field
    final currentYear = DateTime.now().year;
    return year >= 1900 && year <= currentYear + 5;
  }

  /// Validates if a string can be parsed as a valid year
  static bool isValidYearString(String? yearString) {
    if (yearString == null || yearString.trim().isEmpty) return true;
    final year = int.tryParse(yearString.trim());
    return year != null && isValidYear(year);
  }
}
