import 'package:flutter/material.dart';
import 'package:salon_app/core/config/widgets/custom_button.dart';
import 'package:salon_app/presentaion/auth/screens/auth_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      image: 'assets/images/onboarding1.png',
      title: 'Find Your Perfect Style',
      description: 'Discover the latest trends and services tailored just for you',
    ),
    OnboardingPage(
      image: 'assets/images/onboarding2.png',
      title: 'Expert Stylists',
      description: 'Connect with professional stylists for the perfect look',
    ),
    OnboardingPage(
      image: 'assets/images/onboarding3.png',
      title: 'Easy Booking',
      description: 'Book your appointments with just a few taps',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
  

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(_pages[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    theme.colorScheme.surface.withOpacity(0.7),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.05,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _pages[index].title,
                                  style: theme.textTheme.headlineMedium?.copyWith(
                                    color: theme.colorScheme.onSurface,
                                    fontWeight: FontWeight.bold,
                                    fontSize: constraints.maxWidth * 0.06,
                                  ),
                                ),
                                SizedBox(height: constraints.maxHeight * 0.02),
                                Text(
                                  _pages[index].description,
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    color: theme.colorScheme.onSurface.withOpacity(0.8),
                                    fontSize: constraints.maxWidth * 0.04,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.05),
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: _pages.length,
                      effect: ExpandingDotsEffect(
                        dotColor: theme.colorScheme.onSurface.withOpacity(0.3),
                        activeDotColor: theme.colorScheme.onSurface,
                        dotHeight: constraints.maxWidth * 0.02,
                        dotWidth: constraints.maxWidth * 0.02,
                        expansionFactor: 4,
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.03),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth * 0.05,
                      ),
                      child: CustomButton(
                        
                        txt: _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
                        onPressed: () {
                          if (_currentPage == _pages.length - 1) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                              return AuthScreen();
                            }));
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class OnboardingPage {
  final String image;
  final String title;
  final String description;

  OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });
}