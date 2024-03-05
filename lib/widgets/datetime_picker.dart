import 'package:cash_book_expense_tracker/provider/themes_data.dart';
import 'package:flutter/material.dart';

class MyDateTimePicker {
  void presentDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            builder: (context, child) => Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: selectDark,
                    onPrimary: Colors.black,
                    onSurface: iconColor,
                    onBackground: Colors.white,
                  ),
                  timePickerTheme: const TimePickerThemeData(
                    helpTextStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  dialogBackgroundColor: selectDim,
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            color: selectLight,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                          primary: selectDark,
                          backgroundColor: Colors.black54,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(50)))),
                ),
                child: child!),
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      // selectedDate = pickedDate;
    });
  }

  void presentTimePicker(BuildContext context) {
    showTimePicker(
      context: context,
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: Theme.of(context).primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.white,
              onBackground: const Color.fromRGBO(18, 18, 18, 1),
            ),
            timePickerTheme: const TimePickerThemeData(
              helpTextStyle: TextStyle(color: Colors.white, fontSize: 11),
              backgroundColor: Color.fromRGBO(43, 45, 49, 1),
            ),
            dialogBackgroundColor: Colors.black,
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      color: Color.fromRGBO(0, 169, 151, 1),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    primary: Theme.of(context).primaryColor,
                    backgroundColor: Colors.black54,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)))),
          ),
          child: child!),
      initialTime: TimeOfDay.now(),
    ).then((pickedTime) {
      if (pickedTime == null) {
        return;
      }
      // selectedTime = pickedTime;
    });
  }
}
