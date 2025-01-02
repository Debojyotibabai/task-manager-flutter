import 'package:app/features/add_task/presentation/pages/add_task_page.dart';
import 'package:app/features/home/presentation/bloc/all_task/all_task_bloc.dart';
import 'package:app/features/home/presentation/bloc/delete_task/delete_task_bloc.dart';
import 'package:app/features/home/presentation/widgets/calendar.dart';
import 'package:app/features/home/presentation/widgets/task_card.dart';
import 'package:app/features/welcome/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Tasks",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddTaskPage(),
              ),
            );
          },
          icon: Icon(
            Icons.add,
            color: Colors.black,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.clear();

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => WelcomePage(),
                ),
                (route) => false,
              );
            },
            icon: Icon(
              Icons.logout,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Calendar(),
            Expanded(
              child: BlocListener<DeleteTaskBloc, DeleteTaskState>(
                listener: (context, state) {
                  if (state is DeleteTaskSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }

                  if (state is DeleteTaskError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                child: BlocConsumer<AllTaskBloc, AllTaskState>(
                  listener: (context, state) {
                    if (state is AllTaskError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AllTaskLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );
                    } else if (state is AllTaskSuccess) {
                      if (state.tasks.isNotEmpty) {
                        return ListView.builder(
                          itemCount: state.tasks.length,
                          itemBuilder: (context, index) => TaskCard(
                            id: state.tasks[index].id,
                            title: state.tasks[index].title,
                            description: state.tasks[index].description,
                            hexColor: state.tasks[index].hexColor,
                            dueAt: state.tasks[index].dueAt,
                            createdAt: state.tasks[index].createdAt,
                            onDelete: () {
                              BlocProvider.of<DeleteTaskBloc>(context).add(
                                DeleteTask(id: state.tasks[index].id!),
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(
                          child: Text(
                            "No task has been found!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }
                    } else if (state is AllTaskError) {
                      return Center(
                        child: Text(
                          "Something went wrong!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
