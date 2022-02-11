 import 'package:flutter/material.dart';
class CustomDatePicker{
  Future<void> selectDate(BuildContext context, void Function(dynamic selectedData) onSelect, DateTime selectedData,  DateTime firstDate, DateTime lastDate) async {
    
    final DateTime? picked = await showDatePicker(context: context,  initialDate: selectedData, firstDate: firstDate, lastDate: lastDate);
    if(picked != null && picked != selectedData){
      selectedData = picked;
      onSelect(selectedData);
    }
  }
}
