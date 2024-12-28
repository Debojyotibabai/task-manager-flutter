import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int? selectedMonth;
  List<Map<String, int>> datesWithWeekdays = [];
  int? selectedDate;

  @override
  void initState() {
    selectedMonth = DateTime.now().month;
    datesWithWeekdays = getDatesWithWeekdays();
    selectedDate = DateTime.now().day;

    super.initState();
  }

  List<Map<String, int>> getDatesWithWeekdays() {
    List<Map<String, int>> result = [];
    DateTime now = DateTime.now();
    int totalDays = DateTime(now.year, selectedMonth! + 1, 0).day;

    for (int i = 1; i <= totalDays; i++) {
      DateTime currentDate = DateTime(now.year, selectedMonth!, i);
      String weekday = DateFormat('E').format(currentDate);
      result.add({weekday: i});
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                if (selectedMonth! > 1) {
                  setState(() {
                    selectedMonth = selectedMonth! - 1;
                    datesWithWeekdays = getDatesWithWeekdays();
                    selectedDate = null;
                  });
                }
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 25,
              ),
            ),
            Text(
              Constants.monthNames[selectedMonth! - 1],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            IconButton(
              onPressed: () {
                if (selectedMonth! < 12) {
                  setState(() {
                    selectedMonth = selectedMonth! + 1;
                    datesWithWeekdays = getDatesWithWeekdays();
                    selectedDate = null;
                  });
                }
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 25,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: datesWithWeekdays.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDate = datesWithWeekdays[index].values.first;
                  });
                },
                child: Container(
                  width: 80,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: datesWithWeekdays[index].values.first == selectedDate
                        ? Colors.orange[900]
                        : Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          datesWithWeekdays[index].values.first.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: datesWithWeekdays[index].values.first ==
                                    selectedDate
                                ? Colors.white
                                : Colors.black,
                            fontSize: 19,
                          ),
                        ),
                        Text(
                          datesWithWeekdays[index].keys.first,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: datesWithWeekdays[index].values.first ==
                                    selectedDate
                                ? Colors.white
                                : Colors.black,
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
