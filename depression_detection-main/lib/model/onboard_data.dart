class OnBoarding {
  final String title;
  final String image;

  OnBoarding({
    required this.title,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(title: 'Find Trusted Doctors', image: 'assets/images/1.jpeg'),
  OnBoarding(title: 'Choose Best Doctors', image: 'assets/images/2.jpeg'),
  OnBoarding(title: 'Easy Appointments', image: 'assets/images/3.jpeg'),
];
