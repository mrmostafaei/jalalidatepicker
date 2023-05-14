import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jalalidatepicker/src/datepicker.dart';
import 'package:jalalidatepicker/src/jalalicalendarpicker.dart';
import 'package:jalalidatepicker/src/persian_date.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  PersianDate persianDate = PersianDate("yyyy/mm/dd  \n DD  , d  MM  ");
  String _datetime = '';
  String _format = 'yyyy-mm-dd';
  String _value = '';
  String _valuePiker = '';
  DateTime selectedDate = DateTime.now();

  Future _selectDate() async {
    String? picked = await jalaliCalendarPicker(
        context: context,
        convertToGregorian: false,
        showTimePicker: true,
        hore24Format: true);
    if (picked != null) setState(() => _value = picked);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Persain Date'),
        centerTitle: true,
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text('  مبدّل تاریخ و زمان ,‌ تاریخ هجری شمسی '),
                  Text(' تقویم شمسی '),
                  Text('date picker شمسی '),
                  new ElevatedButton(
                    onPressed: _selectDate,
                    child: new Text('نمایش تقویم'),
                  ),
                  new ElevatedButton(
                    onPressed: _showDatePicker,
                    child: new Text('نمایش دیت پیکر'),
                  ),
                  Text(
                    "\nزمان و تاریخ فعلی سیستم :  ${persianDate.getNow}",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                  Divider(),
                  Text(
                    "تقویم ",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _value,
                    textAlign: TextAlign.center,
                  ),
                  Divider(),
                  Text(
                    _valuePiker,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
            // Expanded(child: ShowCalender())
          ],
        ),
      ),
    );
  }

  /// Display date picker.
  void _showDatePicker() {
    final bool showTitleActions = false;
    DatePicker.showDatePicker(context,
        minYear: 1300,
        maxYear: 1450,
/*      initialYear: 1368,
      initialMonth: 05,
      initialDay: 30,*/
        confirm: Text(
          'تایید',
          style: TextStyle(color: Colors.red),
        ),
        cancel: Text(
          'لغو',
          style: TextStyle(color: Colors.cyan),
        ),
        dateFormat: _format, onChanged: (year, month, day) {
      if (!showTitleActions) {
        _changeDatetime(year!, month!, day!);
      }
    }, onConfirm: (year, month, day) {
      _changeDatetime(year!, month!, day!);
      _valuePiker =
          " تاریخ ترکیبی : $_datetime  \n سال : $year \n  ماه :   $month \n  روز :  $day";
    });
  }

  void _changeDatetime(int year, int month, int day) {
    setState(() {
      _datetime = '$year-$month-$day';
    });
  }
}
