import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:omar_system/size_config.dart';

import '../../../controllers/call_records_controller.dart';

class DataFilter extends StatefulWidget {
  final VoidCallback getData;
  const DataFilter({Key? key, required this.getData}) : super(key: key);

  @override
  State<DataFilter> createState() => _DataFilterState();
}

class _DataFilterState extends State<DataFilter> {

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: SizedBox(
          height: screenHeightMultiply(0.9, context),
          child: ListView(
            children: [
              const SizedBox(height: 10,),

              const Text('   Search by' ,style: TextStyle(fontSize: 15),),
              const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                      color: Colors.black54,
                      style: BorderStyle.solid,
                      width: 1.4),
                ),
                child: DropdownButton<String>(
                  value: recordsData.nameType,
                  elevation: 16,
                  // style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      recordsData.nameType = value!;
                    });
                  },
                  items: recordsData.nameTypeList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                onChanged: (value) {
                  recordsData.name = value;
                  widget.getData();

                },

                // initialValue : Provider.of<OnUploadProgress>(context, listen: false).start,
                autofocus: false,
                style: const TextStyle(fontSize: 13.0, color: Colors.black87),
                decoration: const InputDecoration(
                  hintText: 'الاسم / الرقم / الإيميل / المدينة',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(
                      width: 5,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              const Text('   Phone Status' ,style: TextStyle(fontSize: 15),),
              const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                      color: Colors.black54,
                      style: BorderStyle.solid,
                      width: 1.4),
                ),
                child: DropdownButton<String>(
                  value: recordsData.phoneStatus,
                  elevation: 16,
                  // style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      recordsData.phoneStatus = value!;
                    });
                    widget.getData();

                  },
                  items: recordsData.phoneStatusList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 15,),
              const Text('   Customer Status' ,style: TextStyle(fontSize: 15),),
              const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                      color: Colors.black54,
                      style: BorderStyle.solid,
                      width: 1.4),
                ),
                child: DropdownButton<String>(
                  value: recordsData.customerStatus,
                  elevation: 16,
                  // style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      recordsData.customerStatus = value!;
                    });
                    widget.getData();

                  },
                  items: recordsData.customerStatusList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 15,),
              const Text('   Final Status' ,style: TextStyle(fontSize: 15),),
              const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                      color: Colors.black54,
                      style: BorderStyle.solid,
                      width: 1.4),
                ),
                child: DropdownButton<String>(
                  value: recordsData.finalStatus,
                  elevation: 16,
                  // style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      recordsData.finalStatus = value!;
                    });
                    widget.getData();

                  },
                  items: recordsData.finalStatusList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}
