import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:sundial/models/user.dart';

class Homepage extends StatefulWidget {
  final User? user;
  final List<dynamic>? workouts;
  const Homepage({super.key, this.user, this.workouts});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String greetingMessage = '';

  @override
  void initState() {
    super.initState();
    greetingMessage = getGreeting();
  }

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = widget.user;
    var workouts = widget.workouts;

    return Scaffold(
      backgroundColor: const Color(0xFF06141B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        greetingMessage,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 16.0, color: Colors.white70),
                        ),
                      ),
                      Text(
                        user!.username,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 24.0, color: Color(0XFFF45050)),
                        ),
                      )
                    ],
                  ),
                  const IconButton(
                    icon: HugeIcon(
                      icon: HugeIcons.strokeRoundedSettings05,
                      color: Color(0XFFF45050),
                      size: 32.0,
                    ),
                    onPressed: null,
                  )
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0XFF942D2D),
                            Color(0XFFF45050),
                            Color(0XFFF45050),
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      height: 160,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Minutes \nMoved",
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xFFF0F0F0))),
                                ),
                                const Spacer(),
                                const HugeIcon(
                                  icon: HugeIcons.strokeRoundedStopWatch,
                                  color: Color(0xFFF0F0F0),
                                  size: 32.0,
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "120",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 54.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFF0F0F0),
                                        height: .7),
                                  ),
                                ),
                                Text(
                                  "min",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xFFF0F0F0),
                                        height: 1.0),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0XFF942D2D),
                              Color(0XFFF45050),
                              Color(0XFFF45050),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      height: 160,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Burned \nCalories",
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xFFF0F0F0))),
                                ),
                                const Spacer(),
                                const HugeIcon(
                                  icon: HugeIcons.strokeRoundedFire,
                                  color: Color(0xFFF0F0F0),
                                  size: 32.0,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "144",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 54.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFF0F0F0),
                                        height: .7),
                                  ),
                                ),
                                Text(
                                  "kcal",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xFFF0F0F0),
                                        height: 1.0),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available Workouts",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFFF0F0F0),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      "View All",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFFF45050)),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: workouts?.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    var item = workouts?[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: const Color(0XFFF45050),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        height: 80.0,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const HugeIcon(
                                icon: HugeIcons.strokeRoundedFire,
                                color: Color(0xFFF45050),
                                size: 32.0,
                              ),
                              Text(
                                item['name'],
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 18.0,
                                    color: Color(0xFFF0F0F0),
                                  ),
                                ),
                              ),
                              Text(
                                item['duration'].toString(),
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFF0F0F0),
                                  ),
                                ),
                              ),
                              const IconButton(
                                onPressed: null,
                                icon: HugeIcon(
                                  icon: HugeIcons
                                      .strokeRoundedMoreVerticalSquare01,
                                  color: Color(0xFFF45050),
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
          ),
        ),
      ),
    );
  }
}
