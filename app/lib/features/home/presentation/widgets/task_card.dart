import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskCard extends StatelessWidget {
  final String? id;
  final String? title;
  final String? description;
  final String? hexColor;
  final DateTime? dueAt;
  final DateTime? createdAt;

  const TaskCard({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.hexColor,
    required this.dueAt,
    required this.createdAt,
  });

  Color getColorFromHex(String color) {
    color = color.replaceAll("#", "");
    if (color.length == 6) {
      color = "FF$color";
    }
    return Color(int.parse("0x$color"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.64,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: getColorFromHex(hexColor!),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                description != ""
                    ? Column(
                        children: [
                          SizedBox(height: 5),
                          Text(
                            description!,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(height: 20),
                Text(
                  "${DateFormat('hh:mma').format(dueAt!)} - ${DateFormat('hh:mma').format(dueAt!.add(Duration(hours: 1)))}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "•",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.black45,
                ),
              ),
              SizedBox(width: 7),
              Container(
                margin: EdgeInsets.only(top: 4.5),
                child: Text(
                  DateFormat("hh:mma").format(createdAt!.toLocal()),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
