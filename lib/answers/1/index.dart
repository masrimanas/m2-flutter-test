// 1. How to add firebase messaging to the project?
// Answers: We can add firebase_messaging package to our app, by simply add the
// package into our pubspec.yaml
// Honestly, I've never used this package (yet) to implement push notification
// in my app. But, I'll try to tell you the 'How to' I got from our best friend
// Official Docs and some more references from
// https://medium.com/firebase-tips-tricks/how-to-use-firebase-cloud-messaging-in-flutter-a15ca69ff292.

// In order to use firebase services, we got to create a project at firebase.
// We can use flutterfire to get the job done then add firebase_core package and
// set minSdk in build.gradle to 19.

// To receive a push notification using firebase, at first we need to get the
// device's registration token

// we put our push notification's code in the main widget of our app and it must
// be a StatefulWidget

// add this import
import 'package:firebase_messaging/firebase_messaging.dart';

// add this variable in class state above initState() method
// ignore: unnecessary_late
late FirebaseMessaging fcm = FirebaseMessaging.instance;

// add this code into initState to get the token
// fcm.getToken();

// To handle push notification on foreground we can add these codes into
// initState() method.

// FirebaseMessaging.onMessage.listen((RemoteMessage event) {
//   print('Pesan ${event.notification!.body!}');
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("Notification"),
//           content: Text(event.notification!.body!),
//           actions: [
//             TextButton(
//               child: const Text("OK"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             )
//           ],
//         );
//       });
// });
// FirebaseMessaging.onMessageOpenedApp.listen((message) {
//   print('Message clicked!');
// });

// Now, we can receive our first push notification by sending it from this page
// https://console.firebase.google.com/project/_/notification

// before that we need to add these codea into main method in main.dart

// WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

// and change its type to Future<void> and add async keyword.

// First Notification received!!!

// To enable our app to receive push notification on background, add this method
// on top of our main() method

// ignore: unused_element
Future<void> _notificationHandler(RemoteMessage message) async {
  print('background message ${message.notification!.body}');
}

// then add this one more line into our main() method
  // FirebaseMessaging.onBackgroundMessage(_notificationHandler);

// and We did it! :D
