import 'package:app/features/add_task/presentation/bloc/add_task/add_task_bloc.dart';
import 'package:app/shared/button/app_primary_button.dart';
import 'package:app/shared/text_input/app_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime selectedTime = DateTime.now();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Color? selectedColor = Colors.orange[100];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> addTask() async {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AddTaskBloc>(context).add(
        AddTask(
          title: titleController.text,
          description: descriptionController.text,
          hexColor:
              '#${selectedColor!.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}',
          dueAt: selectedTime.toIso8601String(),
        ),
      );
    }
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
              DatePicker.showDateTimePicker(context,
                  showTitleActions: true,
                  minTime: DateTime.now(), onConfirm: (time) {
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
              DateFormat('dd-MM-yyyy').format(selectedTime),
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
                BlocConsumer<AddTaskBloc, AddTaskState>(
                  listener: (context, state) {
                    if (state is AddTaskSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.message,
                          ),
                        ),
                      );

                      Navigator.pop(context);
                    }

                    if (state is AddTaskError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.message,
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return AppPrimaryButton(
                      title: "Submit",
                      onTap: addTask,
                      isLoading: state is AddTaskLoading,
                      isDisabled: state is AddTaskLoading,
                    );
                  },
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
