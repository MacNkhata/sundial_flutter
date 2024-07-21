import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sundial/screens/auth/login.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the AppBar transparent
        elevation: 0,
      ),
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar
      body: Stack(
        children: [
          PageView.builder(
            itemCount: data.length,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            itemBuilder: (context, index) => OnBoardContent(
              title: data[index].title,
              description: data[index].description,
              backgroundImage: data[index].backgroundImage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      ...List.generate(
                        data.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: DotIndicator(
                            isActive: index == _pageIndex,
                          ),
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      if (_pageIndex == data.length - 1)
                        const SizedBox.shrink()
                      else
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      const Spacer(),
                      if (_pageIndex == data.length - 1)
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            backgroundColor: const Color(0XFFF45050),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          label: const Text(
                            "Get Started",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        )
                      else
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              // Move to the next onboarding screen
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(15),
                              backgroundColor: const Color(0XFFF45050),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_sharp,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 14,
      width: isActive ? 24 : 14,
      decoration: BoxDecoration(
        color: isActive ? const Color(0XFFF45050) : Colors.transparent,
        border: isActive
            ? Border.all(color: Colors.transparent)
            : Border.all(
                color: Colors.white,
                width: 1,
              ),
        borderRadius: BorderRadius.circular(
            6), // Make sure this is half of height/width for perfect circle
      ),
    );
  }
}

class Onboard {
  final String title, description, backgroundImage;

  Onboard(
      {required this.title,
      required this.description,
      required this.backgroundImage});
}

final List<Onboard> data = [
  Onboard(
      title: "No gym?\nHome workouts.",
      description:
          "With only a gym mat and your bodyweight you can sculpt your desired body.",
      backgroundImage: "assets/images/OnboardingBg1.png"),
  Onboard(
    title: "This is time\nunder tension.",
    description:
        "Timed exercises focus on quality of the exercises not the quantity",
    backgroundImage: "assets/images/OnboardingBg2.png",
  ),
  Onboard(
    title: "Don’t forget\nhydration is key.",
    description:
        "Water is also a vital part of any exercise as it cleans toxins in the body.",
    backgroundImage: "assets/images/OnboardingBg3.png",
  ),
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    super.key,
    required this.title,
    required this.description,
    required this.backgroundImage,
  });

  final String title, description, backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF06141B).withOpacity(0.7),
                Colors.transparent
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Spacer(),
              const Spacer(),
              Text(
                title,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                description,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ],
    );
  }
}
