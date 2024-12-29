import 'package:app/shared/button/app_primary_button.dart';
import 'package:app/shared/text_input/app_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime selectedTime = DateTime.now().add(Duration(hours: 1));

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Color? selectedColor = Colors.orange[100];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addTask() async {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Add New Task",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 25,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              DatePicker.showTime12hPicker(context, showTitleActions: true,
                  onConfirm: (time) {
                if (time.isBefore(DateTime.now())) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "You can't select a time in the past",
                      ),
                    ),
                  );

                  return;
                }

                setState(() {
                  selectedTime = time;
                });
              }, locale: LocaleType.en);
            },
            child: Text(
              DateFormat('dd-MM-yyyy').format(DateTime.now()),
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextInput(
                  controller: titleController,
                  hintText: "Title",
                ),
                SizedBox(
                  height: 15,
                ),
                AppTextInput(
                  controller: descriptionController,
                  hintText: "Description",
                  maxLines: 5,
                  required: false,
                ),
                ColorPicker(
                  color: selectedColor!,
                  onColorChanged: (Color color) {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                  width: 44,
                  height: 44,
                  heading: Text(
                    'Select card color',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  subheading: Text(
                    'Choose color shade',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  pickersEnabled: const <ColorPickerType, bool>{
                    ColorPickerType.primary: true,
                    ColorPickerType.wheel: true,
                  },
                ),
                SizedBox(height: 50),
                AppPrimaryButton(
                  title: "Submit",
                  onTap: addTask,
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
