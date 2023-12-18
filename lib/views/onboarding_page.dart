import 'package:depression_app/app_styles.dart';
import 'package:depression_app/model/onboard_data.dart';
import 'package:depression_app/size_configs.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            Expanded(
                child: PageView.builder(
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
                                child: Image.asset(
                                    onboardingContents[index].image),
                              ),
                            ),
                            Text(
                              onboardingContents[index].title,
                              style: kTitle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )))
          ]),
        ));
  }
}
