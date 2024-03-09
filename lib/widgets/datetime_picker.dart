import 'package:cash_book_expense_tracker/provider/themes_data.dart';
import 'package:flutter/material.dart';

class MyDateTimePicker {
  void presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return myTheme(child);
      },
    ).then((selectedDate) {
      return;
    });
  }

  void presentTimePicker(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return myTheme(child);
      },
    ).then((pickedTime) {
      if (pickedTime == null) {
        return;
      }
      // selectedTime = pickedTime;
    });
  }

  Theme myTheme(Widget? child) {
    return Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.light(
            primary: selectDark,
            onPrimary: Colors.white,
            surface: Colors.white,
            background: Colors.white,
            onSurface: Colors.black,
            outline: const Color.fromARGB(255, 244, 244, 244),
            primaryContainer: selectDark,
            secondaryContainer: selectDark,
            tertiaryContainer: selectDark,
            onPrimaryContainer: Colors.white,
            onSecondaryContainer: Colors.white,
            onTertiaryContainer: Colors.white,
            onSurfaceVariant: Colors.black,
            surfaceVariant: const Color.fromARGB(255, 244, 244, 244),
            surfaceTint: Colors.transparent,
          ),
        ),
        child: child!);
  }
}
