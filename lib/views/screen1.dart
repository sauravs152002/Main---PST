import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainproject_crop/views/profile.dart';
import 'package:mainproject_crop/views/screen2.dart';
import 'package:mainproject_crop/views/screen3.dart';


class TasksPage extends StatefulWidget {
 
  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color.fromRGBO(242, 244, 255, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                 Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.menu_rounded,
                    size: 30,
                  ),
                  GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Profile1()));
                        },

                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 123, 0, 245),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
  
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddNewTask()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 123, 0, 245),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                "Add Device",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Prediction Results",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      ProgressCard(
                          ProjectName: "Week 1", CompletedPercent: 30),
                      ProgressCard(
                          ProjectName: "Week 2", CompletedPercent: 30),
                      ProgressCard(
                          ProjectName: "Week 3", CompletedPercent: 30),
                      ProgressCard(
                          ProjectName: "Week 4", CompletedPercent: 30),
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
