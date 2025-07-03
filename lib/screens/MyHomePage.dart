import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_company/global/page_one_info.dart';
import 'package:null_company/url_launcher.dart';

import '../colors.dart';
import '../global/page_two_info.dart';
import 'page_one.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors['primaryBackground'],
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "YourSeat",
            style: TextStyle(
              fontFamily: "eng",
              color: appColors['appBarText'],
              fontSize: 30,
            ),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: appColors['primaryBackground'],
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate responsive font sizes and paddings
          final double screenWidth = constraints.maxWidth;
          final double screenHeight = constraints.maxHeight;
          final double baseFontSize = screenWidth < 600 ? 16 : 20;
          final double heroFontSize = screenWidth < 600 ? 100 : 150;
          final double buttonWidth =
              screenWidth < 600 ? screenWidth * 0.35 : 200;
          final double buttonHeight =
              screenWidth < 600 ? screenHeight * 0.06 : 50;

          return ListView(
            controller: _scrollController,
            children: [
              // Section 0: My Products (Moved to Top)

              // Section 1: Hero Section
              Container(
                height: screenHeight * 0.9,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      appColors['gradientStart']!,
                      appColors['gradientEnd']!,
                    ],
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth < 600 ? 20 : 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "n",
                          style: TextStyle(
                            fontFamily: "eng",
                            color: appColors['heroMainText'],
                            fontSize: heroFontSize,
                            height: 0.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05),
                        Text(
                          "Software Solutions for Everyday Needs",
                          style: TextStyle(
                            color: appColors['heroMainText'],
                            fontSize: baseFontSize * 1.5,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          "Develops innovative and practical apps to simplify daily tasks and enhance user experience.",
                          style: TextStyle(
                            color: appColors['heroSubText'],
                            fontSize: baseFontSize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.05),
                        Wrap(
                          spacing: screenWidth * 0.05,
                          alignment: WrapAlignment.center,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  appColors['buttonBackground'],
                                ),
                                minimumSize: MaterialStatePropertyAll(
                                  Size(buttonWidth, buttonHeight),
                                ),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                _scrollController.animateTo(
                                  _scrollController.offset + screenHeight,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Text(
                                "My Products",
                                style: TextStyle(
                                  color: appColors['textPrimary'],
                                  fontSize: baseFontSize * 0.9,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: screenWidth < 600 ? 20 : 40,
                ),
                child: Text(
                  "MY Products",
                  style: TextStyle(
                    color: appColors['appBarText'],
                    fontSize: baseFontSize * 1.8,
                    fontWeight: FontWeight.w900,
                    fontFamily: "web",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // Section 2: Products
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth < 600 ? 20 : 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/page_one');
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width:
                                    screenWidth < 600 ? screenWidth * 0.2 : 100,
                                height:
                                    screenWidth < 600 ? screenWidth * 0.2 : 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage(appLogo),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                appName,
                                style: TextStyle(
                                  color: appColors['appBarText'],
                                  fontSize: baseFontSize * 0.8,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth < 600 ? 20 : 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/page_two');
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width:
                                    screenWidth < 600 ? screenWidth * 0.2 : 100,
                                height:
                                    screenWidth < 600 ? screenWidth * 0.2 : 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage(appLogo),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                pageTwoName,
                                style: TextStyle(
                                  color: appColors['appBarText'],
                                  fontSize: baseFontSize * 0.8,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Section 3: Footer
              Container(
                color: appColors['primaryBackground'],
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children: [
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.facebook,
                        color: appColors['iconColor'],
                        size: 25,
                      ),
                      onPressed: facebook,
                    ),
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.linkedin,
                        color: appColors['iconColor'],
                        size: 25,
                      ),
                      onPressed: linkedIn,
                    ),
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.github,
                        color: appColors['iconColor'],
                        size: 25,
                      ),
                      onPressed: github,
                    ),
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.solidEnvelope,
                        color: appColors['iconColor'],
                        size: 25,
                      ),
                      onPressed: email,
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
