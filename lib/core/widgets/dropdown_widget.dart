import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T? selectedItem;
  final String hint;
  final Function(T?) onChanged;
  final String Function(T)? itemAsString;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.selectedItem,
    this.hint = 'Select an item',
    required this.onChanged,
    this.itemAsString,
  }) : super(key: key);

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade400, width: 1),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: widget.selectedItem,
          hint: Text(
            widget.hint,
            style: TextStyle(color: Colors.grey.shade600),
          ),
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down, color: Colors.grey.shade700),
          iconSize: 24,
          style: TextStyle(color: Colors.black87, fontSize: 16),
          onChanged: widget.onChanged,
          items: widget.items.map<DropdownMenuItem<T>>((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                widget.itemAsString != null
                    ? widget.itemAsString!(item)
                    : item.toString(),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}