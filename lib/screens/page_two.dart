import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_company/global/page_two_info.dart';
import 'package:null_company/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

Map<String, Color> appColors = {
  "textPrimary": Color(0xFF1C1C1C), // نص أساسي بلون غامق
  "primaryBackground": Color(0xFFF5F7F9), // خلفية رئيسية بلون هادئ وفاتح جدًا
  "gradientStart": Color(0xFFE8ECF1), // بداية التدرج بلون رمادي مائل للأزرق
  "gradientEnd": Color(0xFFDDE3EA), // نهاية التدرج بلون أفتح
  "appBarText":
      Color(0xFF1A1A1A), // لون النص في الـ AppBar داكن ليتباين مع الخلفية
  "heroMainText": Color(0xFF333333), // نص رئيسي غامق قليلاً
  "heroSubText": Color(0xFF666666), // نص فرعي بلون رمادي متوسط
  "buttonBackground":
      Color(0xffFFF0F2), // زر بلون أزرق هادئ (نفسه من الوضع الداكن)
  "buttonText": Color(0xFFFFFFFF), // نص الزر أبيض لتباين واضح
  "iconColor": Color(0xFF444444), // أيقونات بلون رمادي غامق
};

class PageTwo extends StatelessWidget {
  PageTwo({super.key});

  void _showMessage(BuildContext context) {
    final randomMessage = (pageTwoMessages..shuffle()).first;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          randomMessage,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: appColors['buttonText']),
        ),
        backgroundColor: appColors['cardBackground'],
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // void _downloadSecondApk() async {
  //   final Uri url = Uri.parse(pageTwoURL);
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url, mode: LaunchMode.externalApplication);
  //   } else {
  //     throw "Could not launch $url";
  //   }
  // }

  void _dashBoard() async {
    final Uri url = Uri.parse(dashBoard);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

  // void _IOS_downloadApk() async {
  //   if (IOS_appURL == null) {
  //     // _showMessage(context);

  //     return;
  //   }
  //   final Uri url = Uri.parse(IOS_appURL!);
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url, mode: LaunchMode.externalApplication);
  //   } else {
  //     throw "Could not launch $url";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true, // Extend gradient behind AppBar
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Transparent to show gradient
          iconTheme: IconThemeData(color: appColors['appBarText']),
          title: Text(
            pageTwoName,
            style: TextStyle(
              color: appColors['appBarText'],
              fontSize: 24,
              fontWeight: FontWeight.w900,
              fontFamily: "web",
            ),
          ),
          centerTitle: true,
          elevation: 0, // Remove shadow for seamless gradient
        ),
        body: Container(
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
            child: LayoutBuilder(builder: (context, constraints) {
              final double screenWidth = constraints.maxWidth;
              final double baseFontSize = screenWidth < 600 ? 16 : 20;
              final double buttonHeight = screenWidth < 600 ? 50 : 60;

              return ListView(children: [
                SizedBox(
                    height: screenWidth < 600 ? 60 : 80), // Space for AppBar
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth < 600 ? 15 : 30),
                  child: ListTile(
                    leading: Transform.scale(
                      scale: screenWidth < 600 ? 1.2 : 1.5,
                      child: Container(
                        width: screenWidth < 600 ? 50 : 60,
                        height: screenWidth < 600 ? 50 : 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage(pageTwoLogo),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      pageTwoName,
                      style: TextStyle(
                        color: appColors['textPrimary'],
                        fontSize: baseFontSize * 1.5,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth < 600 ? 15 : 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // TextButton(
                      //   style: ButtonStyle(
                      //     backgroundColor: MaterialStatePropertyAll(
                      //         appColors['buttonBackground']),
                      //     minimumSize: MaterialStatePropertyAll(
                      //       Size(screenWidth * 0.9, buttonHeight),
                      //     ),
                      //     shape: MaterialStatePropertyAll(
                      //       RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //     ),
                      //   ),
                      //   // onPressed: _downloadSecondApk,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       FaIcon(
                      //         FontAwesomeIcons.android,
                      //         color: Colors.green,
                      //         size: baseFontSize * 1.2,
                      //       ),
                      //       const SizedBox(width: 10),
                      //       Text(
                      //         "download",
                      //         style: TextStyle(
                      //           color: appColors['textPrimary'],
                      //           fontSize: baseFontSize * 0.9,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(height: 8),
                      // TextButton(
                      //   style: ButtonStyle(
                      //     backgroundColor: MaterialStatePropertyAll(
                      //         appColors['buttonBackground']),
                      //     minimumSize: MaterialStatePropertyAll(
                      //       Size(screenWidth * 0.9, buttonHeight),
                      //     ),
                      //     shape: MaterialStatePropertyAll(
                      //       RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //     ),
                      //   ),
                      //   onPressed: () {
                      //     IOS_appURL == null
                      //         ? _showMessage(context)
                      //         : _IOS_downloadApk();
                      //   },
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Icon(
                      //         Icons.apple,
                      //         color: appColors['cardTextSecondary'],
                      //         size: baseFontSize * 1.5,
                      //       ),
                      //       const SizedBox(width: 10),
                      //       Text(
                      //         "Soon...",
                      //         style: TextStyle(
                      //           color: appColors['textPrimary'],
                      //           fontSize: baseFontSize * 0.9,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(height: 8),
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  appColors['buttonBackground']),
                              minimumSize: MaterialStatePropertyAll(
                                Size(screenWidth * 0.9, buttonHeight),
                              ),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: _dashBoard,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.web,
                                  color: appColors['cardTextSecondary'],
                                  size: baseFontSize * 1.5,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  " DashBoard ",
                                  style: TextStyle(
                                    color: appColors['textPrimary'],
                                    fontSize: baseFontSize * 0.9,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 8,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("بيانات الدخول"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text("email: admin@admin.com"),
                                        Text("password: Aa@#1234"),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("حسناً"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.info_outline,
                                color: Colors.red,
                                size: 25,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(
                    height: screenWidth < 600 ? 150 : 200,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    viewportFraction: screenWidth < 600 ? 0.4 : 0.3,
                  ),
                  items: pageTwoImages.map((imagePath) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(imagePath, fit: BoxFit.cover),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 15),
                Text(
                  "What is $pageTwoName?",
                  style: TextStyle(
                    color: appColors['textPrimary'],
                    fontSize: baseFontSize * 1.3,
                    fontWeight: FontWeight.w900,
                    fontFamily: "web",
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth < 600 ? 10 : 20),
                  child: Text(
                    pageTwoDescription,
                    style: TextStyle(
                      color: appColors['textSecondary'],
                      fontSize: baseFontSize * 0.8,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "$pageTwoName’s Top Features",
                  style: TextStyle(
                    color: appColors['textPrimary'],
                    fontSize: baseFontSize * 1.3,
                    fontWeight: FontWeight.w900,
                    fontFamily: "web",
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth < 600 ? 20 : 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: pageTwoFeatures.map((feature) {
                      return Card(
                        color: appColors['cardBackground'],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Icon(
                                feature["icon"] as IconData,
                                color: appColors['cardTextPrimary'],
                                size: baseFontSize * 1.2,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      feature["title"] as String,
                                      style: TextStyle(
                                        color: appColors['cardTextPrimary'],
                                        fontSize: baseFontSize * 0.9,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      feature["description"] as String,
                                      style: TextStyle(
                                        color: appColors['cardTextSecondary'],
                                        fontSize: baseFontSize * 0.7,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
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
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    children: [
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.facebook,
                          color: appColors['iconColor'],
                          size: baseFontSize,
                        ),
                        onPressed: facebook,
                      ),
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.linkedin,
                          color: appColors['iconColor'],
                          size: baseFontSize,
                        ),
                        onPressed: linkedIn,
                      ),
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.github,
                          color: appColors['iconColor'],
                          size: baseFontSize,
                        ),
                        onPressed: github,
                      ),
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.solidEnvelope,
                          color: appColors['iconColor'],
                          size: baseFontSize,
                        ),
                        onPressed: email,
                      ),
                    ],
                  ),
                ),
              ]);
            })));
  }
}
