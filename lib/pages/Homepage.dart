import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todooapp/models/task_model.dart';
import 'package:todooapp/services/todo_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _textcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    backgroundColor: Colors.blueGrey[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    title: Center(
                      child: Text(
                        'Create a new task',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 18),
                      ),
                    ),
                    content: TextField(
                      controller: _textcontroler,
                      style:
                          GoogleFonts.gaegu(color: Colors.white, fontSize: 18),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                context
                                    .read<Taskprovider>()
                                    .addTask(Task(title: _textcontroler.text));
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Create',
                                style: GoogleFonts.poppins(
                                    color: Colors.blueGrey[600]),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.poppins(
                                    color: Colors.blueGrey[600]),
                              ))
                        ],
                      )
                    ],
                  ));
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/pixel.jpg'), fit: BoxFit.cover)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 41),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blueGrey,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  ),
                  Text('< T O D O L I S T >',
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: Colors.blueGrey[800],
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                  width: 330,
                  height: 657,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 8,
                            color: Colors.blueGrey,
                            spreadRadius: 10)
                      ]),
                  child:
                      Consumer<Taskprovider>(builder: (context, value, child) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          // final task = value.tasks[index];
                          return ListTile(
                            title: Text(
                              value.tasks[index].title,
                              style: GoogleFonts.gaegu(fontSize: 25),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      TextEditingController _textcontroler =
                                          TextEditingController(
                                              text: value.tasks[index].title);
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                backgroundColor:
                                                    Colors.blueGrey[600],
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                title: Center(
                                                  child: Text(
                                                    'Update your task',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                content: TextField(
                                                  controller: _textcontroler,
                                                  style: GoogleFonts.gaegu(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                                actions: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            //for testing purpose
                                                            var temptask = Task(
                                                                title:
                                                                    _textcontroler
                                                                        .text);
                                                            temptask.id = value
                                                                .tasks[index]
                                                                .id;
                                                            context
                                                                .read<
                                                                    Taskprovider>()
                                                                .updateTask(
                                                                    temptask);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Update',
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    color: Colors
                                                                            .blueGrey[
                                                                        600]),
                                                          )),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Cancel',
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    color: Colors
                                                                            .blueGrey[
                                                                        600]),
                                                          ))
                                                    ],
                                                  )
                                                ],
                                              ));
                                      //
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blueGrey[400],
                                    )),
                                IconButton(
                                    onPressed: () {
                                      context.read<Taskprovider>().deleteTask(
                                          value.tasks[index]
                                              .id); // 1 for temporary
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red[600],
                                    ))
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.blueGrey,
                            height: 1,
                            thickness: 1,
                          );
                        },
                        itemCount: value.tasks.length);
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
