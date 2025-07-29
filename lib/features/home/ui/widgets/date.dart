import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class Fields extends StatefulWidget {
  const Fields({super.key, required this.platform});

  final DateTimeFieldPickerPlatform platform;

  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  DateTime? selectedDate;
  DateTime? selectedTime;
  DateTime? selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DateTimeField(
          pickerPlatform: widget.platform,
          enabled: false,
          decoration: const InputDecoration(labelText: 'Disabled'),
        ),
        const SizedBox(height: 16),
        DateTimeField(
          decoration: const InputDecoration(
            labelText: 'Enter Date',
            helperText: 'YYYY/MM/DD',
          ),
          value: selectedDate,

          mode: DateTimeFieldPickerMode.date,
          pickerPlatform: widget.platform,
          initialPickerDateTime: DateTime(2001, 11, 20),
          onChanged: (DateTime? value) {
            setState(() {
              selectedDate = value;
            });
          },
        ),
        const SizedBox(height: 16),

      ],
    );
  }
}
