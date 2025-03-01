import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NicController extends GetxController {
  var nicNumber = ''.obs;
  var birthDate = 'N/A'.obs;
  var gender = 'N/A'.obs;
  var age = 0.obs;
  var weekday = 'N/A'.obs;
  var nicType = 'N/A'.obs;
  var votingEligibility = 'N/A'.obs;

  void decodeNIC(String nic) {
    nicNumber.value = nic;
    int year, dayOfYear, serialNumber;
    bool isOldNic = nic.length == 10;

    if (isOldNic) {
      // Old NIC (9 digits + 1 letter)
      nicType.value = "Old NIC";
      year = int.parse(nic.substring(0, 2)) + 1900;
      dayOfYear = int.parse(nic.substring(2, 5));
      serialNumber = int.parse(nic.substring(5, 9));
      votingEligibility.value =
          nic[9].toUpperCase() == 'V' ? "Can Vote" : "Cannot Vote";
    } else if (nic.length == 12) {
      // New NIC (12 digits)
      nicType.value = "New NIC";
      year = int.parse(nic.substring(0, 4));
      dayOfYear = int.parse(nic.substring(4, 7));
      serialNumber = int.parse(nic.substring(7, 12));
      votingEligibility.value = "N/A";
    } else {
      nicType.value = "Invalid NIC";
      return;
    }

    // Determine gender
    if (dayOfYear > 500) {
      gender.value = "Female";
      dayOfYear -= 500;
    } else {
      gender.value = "Male";
    }

    // Convert day of year to date
    DateTime dob = getDateFromDayOfYear(year, dayOfYear);
    birthDate.value = DateFormat('yyyy-MM-dd').format(dob);

    // Calculate age
    DateTime now = DateTime.now();
    age.value = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age.value--;
    }

    // Get weekday name
    weekday.value = DateFormat('EEEE').format(dob);
  }

  // Helper function to get date from day of year, with leap year adjustment
  DateTime getDateFromDayOfYear(int year, int dayOfYear) {
    // Check if it's a leap year
    bool isLeapYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

    // List of days in each month (normal and leap years)
    List<int> daysInMonth = isLeapYear
        ? [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31] // Leap Year
        : [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]; // Normal Year

    int month = 1;

    // Subtract days until we find the correct month
    while (dayOfYear > daysInMonth[month]) {
      dayOfYear -= daysInMonth[month];
      month++;
    }

    // Return the calculated date for the given day of the year
    return DateTime(year, month, dayOfYear - 1);
  }
}
