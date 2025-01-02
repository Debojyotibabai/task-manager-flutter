import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  final int? selectedMonth;
  final int? selectedDate;
  final List<Map<String, int>> datesWithWeekdays;
  final Function() previousMonth;
  final Function() nextMonth;
  final Function(int index) onDateSelect;

  const Calendar({
    super.key,
    required this.selectedMonth,
    required this.selectedDate,
    required this.datesWithWeekdays,
    required this.previousMonth,
    required this.nextMonth,
    required this.onDateSelect,
  });

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
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
                if (widget.selectedMonth! > 1) {
                  widget.previousMonth();
                }
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 25,
              ),
            ),
            Text(
              Constants.monthNames[widget.selectedMonth! - 1],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            IconButton(
              onPressed: () {
                if (widget.selectedMonth! < 12) {
                  widget.nextMonth();
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
            itemCount: widget.datesWithWeekdays.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  widget.onDateSelect(index);
                },
                child: Container(
                  width: 80,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: widget.datesWithWeekdays[index].values.first ==
                            widget.selectedDate
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
                          widget.datesWithWeekdays[index].values.first
                              .toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                widget.datesWithWeekdays[index].values.first ==
                                        widget.selectedDate
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: 19,
                          ),
                        ),
                        Text(
                          widget.datesWithWeekdays[index].keys.first,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                widget.datesWithWeekdays[index].values.first ==
                                        widget.selectedDate
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: 17,
                          ),
                        ),
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
