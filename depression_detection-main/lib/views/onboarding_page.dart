// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:depression_app/app_styles.dart';
import 'package:depression_app/main.dart';
import 'package:depression_app/model/onboard_data.dart';
import 'package:depression_app/screens/signup_screen.dart';
import 'package:depression_app/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/widgets.dart';

// import '../widgets/my_text_button.dart';
// import '../widgets/onboard_nav_btn.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);
  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
        margin: EdgeInsets.only(right: 5),
        duration: Duration(milliseconds: 400),
        height: 12,
        width: 12,
        decoration: BoxDecoration(
            color: currentPage == index ? kPrimaryColor : kSecondaryColor,
            shape: BoxShape.circle));
  }

  Future setSeenonboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setSeenonboard();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            Expanded(
                flex: 9,
                child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: onboardingContents.length,
                    itemBuilder: (context, index) => Stack(
                          children: [
                            Positioned(
                              left: -104,
                              top: -20,
                              child: Container(
                                width: 342,
                                height: 342,
                                decoration: ShapeDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(0.98, -0.19),
                                    end: Alignment(-0.98, 0.19),
                                    colors: [
                                      Color(0xFF0EBE7E),
                                      Color(0xFF07D9AD)
                                    ],
                                  ),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 91,
                              child: Container(
                                width: 336,
                                height: 336,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        onboardingContents[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 48,
                              top: 478,
                              child: Text(
                                onboardingContents[index].title,
                                style: kTitle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Positioned(
                              left: 51,
                              top: 523,
                              child: SizedBox(
                                width: 274,
                                height: 70,
                                child: Text(
                                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
                                  textAlign: TextAlign.center,
                                  style: kBodyText1,
                                ),
                              ),
                            ),
                          ],
                        ))),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    currentPage == onboardingContents.length - 1
                        ? MyTextButton(
                            buttonName: 'Get Started',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signup_screen()));
                            },
                            bgColor: Color(0xff0EBE7F),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              OnBoardNavBtn(
                                name: "Skip",
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              signup_screen()));
                                },
                              ),
                              Row(
                                children: List.generate(
                                    onboardingContents.length,
                                    (index) => dotIndicator(index)),
                              ),
                              OnBoardNavBtn(
                                name: "Next",
                                onPressed: () {
                                  _pageController.nextPage(
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.easeInOut);
                                },
                              ),
                            ],
                          ),
                  ],
                ))
          ]),
        ));
  }
}
