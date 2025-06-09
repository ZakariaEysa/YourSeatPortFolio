import 'package:url_launcher/url_launcher.dart';

websites(String x) async {
  try {
    final Uri uri = Uri.parse("${x}");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<void> openUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> linkedIn() async {
  await openUrl('https://www.linkedin.com/in/zakaria-eysa-b6b430264');
}

Future<void> facebook() async {
  await openUrl('https://www.facebook.com/ZakariaEysa');
}

// Future<void> website() async {
//   await openUrl('https://null-tech.netlify.app/');  // https://null-social-links.netlify.app/
// }

email() async {
  try {
    final Uri uri = Uri.parse("mailto:${"zakariaeysa@gmail.com"}");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  } catch (e) {
    print(e.toString());
  }
}

github() async {
  try {
    final Uri uri = Uri.parse("https://github.com/ZakariaEysa");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  } catch (e) {
    print(e.toString());
  }
}
