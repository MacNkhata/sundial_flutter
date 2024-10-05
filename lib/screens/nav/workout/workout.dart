import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:sundial/services/util.dart';

class Workout extends StatefulWidget {
  String workoutId;

  Workout({super.key, required this.workoutId});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  List<dynamic>? exercises = [];
  Map<String, dynamic>? workout;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getWorkout(widget.workoutId);
    _getExercises(widget.workoutId);
  }

  Future<void> _getExercises(String workoutId) async {
    var exercisesList = await fetchWorkoutExercise(workoutId);
    setState(() {
      exercises = exercisesList;
      _isLoading = false;
    });
  }

  Future<void> _getWorkout(String workoutId) async {
    var workoutObject = await fetchWorkout(workoutId);
    setState(() {
      workout = workoutObject;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF06141B),
        leading: IconButton.filled(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFF0F0F0),
          ),
          color: const Color(0xFFF45050),
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xFFF45050)),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton(
                onPressed: () {
                  print("we up");
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  backgroundColor: const Color(0xFFF45050),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  "Start",
                  style: TextStyle(
                    color: Color(0xFFF0F0F0),
                  ),
                )),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF06141B),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
        child: Column(
          children: [
            _WorkoutHeader(
              workout: workout,
            ),
            const Divider(
              color: Color(0xFFF45050),
            ),
            Container(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : exercises!.isEmpty
                      ? const Center(
                          child: Text("No exercise available for this workout"),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: exercises!.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              var item = exercises![index];
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
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Workout(
                                                      workoutId: item['_id'])),
                                            );
                                          },
                                          iconAlignment: IconAlignment.start,
                                          icon: const HugeIcon(
                                            icon: HugeIcons.strokeRoundedFire,
                                            color: Color(0xFFF45050),
                                            size: 32.0,
                                          ),
                                          label: Text(
                                            item['name'],
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                fontSize: 18.0,
                                                color: Color(0xFFF0F0F0),
                                              ),
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
            ),
          ],
        ),
      )),
    );
  }
}

class _WorkoutHeader extends StatelessWidget {
  final Map<String, dynamic>? workout;

  const _WorkoutHeader({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          workout!['name'],
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF0F0F0),
            ),
          ),
        ),
        Row(
          children: [
            Text(
              "${workout!['duration'] / 60}mins",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFFF45050),
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              "x3",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF45050),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
