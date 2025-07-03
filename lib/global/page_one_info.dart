import 'package:flutter/material.dart';

const String appName = "YourSeat Application";
const String appSize = "70 MB";
const String appLogo = "assets/images/logo.png";
const String appURL =
    "https://drive.google.com/uc?export=download&id=1E-XOxeSIFFT03p36RdWmn4tg8GiHewZs";
const String dashBoard = "https://yourseatgraduationprojec-19068.web.app/";
const String? IOS_appURL = null; // This value can be left
const String appDescription =
    "YourSeat is your smart movie ticket booking app,\ndesigned to make reserving seats at cinemas easy and hassle-free.\n\nSay goodbye to long queues and last-minute stress!\nWith YourSeat, you can browse available movies,\nchoose your favorite cinema and seat,\nand pay securely—all from your phone.\n\nEverything you need for a smooth cinema experience,\nright at your fingertips.📌";

const List<String> appImages = [
  'assets/images/firstApp/signin.jpg',
  'assets/images/firstApp/signup.jpg',
  'assets/images/firstApp/home.jpg',
  'assets/images/firstApp/chatPot.jpg',
  'assets/images/firstApp/playing.jpg',
  'assets/images/firstApp/select.jpg',
  'assets/images/firstApp/payment.jpg',
  'assets/images/firstApp/map.jpg',
  'assets/images/firstApp/watchList.jpg',
  'assets/images/firstApp/about.jpg',
];

const List<Map<String, dynamic>> appFeatures = [
  {
    "title": "Multiple Cinemas 🎬",
    "description":
        "Browse and book tickets from any cinema added to the platform—no restrictions!",
    "icon": Icons.location_city,
  },
  {
    "title": "Interactive Seat Selection 💺",
    "description":
        "Choose your preferred seat in real-time with a live seating map.",
    "icon": Icons.event_seat,
  },
  {
    "title": "Smart Navigation 🗺️",
    "description":
        "View directions from your current location to the cinema using built-in maps.",
    "icon": Icons.map,
  },
  {
    "title": "Secure Payments 💳",
    "description":
        "Pay for your tickets quickly and securely through integrated payment methods.",
    "icon": Icons.payment,
  },
  {
    "title": "Real-Time Pricing 💰",
    "description":
        "Check ticket prices instantly based on the cinema, seat type, and movie time.",
    "icon": Icons.attach_money,
  },
  {
    "title": "User Account Management 🔐",
    "description":
        "Sign in, sign out, and manage your bookings and preferences easily.",
    "icon": Icons.account_circle,
  },
  {
    "title": "Smart Recommendations 🤖",
    "description":
        "Get movie suggestions from a built-in chatbot based on your preferences and watch history.",
    "icon": Icons.chat_bubble_outline,
  },
  {
    "title": "Personal Watchlist 🎥",
    "description":
        "Save your favorite movies and keep track of what you want to watch later.",
    "icon": Icons.bookmark_border,
  },
];

// Messages which appear when iOS version is not supported
final messages = [
  "🚧 iOS version is still loading... Please wait... forever! 😆",
  "🍏 iOS version is coming... Just like that message you left on ‘Seen’! 😂",
  "⏳ Patience is key! iOS version is coming... one day... maybe! 🤣",
  "🤖 We asked Siri about the iOS version... She said ‘Ask me later’! 😜",
  "🚀 This button does not work today... and probably not tomorrow either! 😆",
  "🏖️ This button is on vacation... indefinitely! 😂"
];
