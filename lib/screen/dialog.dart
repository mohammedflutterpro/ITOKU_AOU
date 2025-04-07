// import 'package:audioplayers/audioplayers.dart' show AudioPlayer, UrlSource;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class NumberDialogScreen extends StatelessWidget {
//   final String number = "3";
//   final String englishWord = "Three";
//   final String japaneseWord = "三 (さん)";
//   final String imageUrl = "https://via.placeholder.com/150"; // Replace with actual image
//   final AudioPlayer player = AudioPlayer();
//
//   void playSound() async {
//     // Replace with actual audio file URL or local asset
//     await player.play(UrlSource(''));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Image
//             Image.network(imageUrl, width: 120, height: 120),
//             SizedBox(height: 10),
//
//             // Number & Text
//             Text(number, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.blue)),
//             Text(englishWord, style: TextStyle(fontSize: 20, color: Colors.black54)),
//             Text(japaneseWord, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
//
//             SizedBox(height: 15),
//
//             // Play Sound Button
//             ElevatedButton.icon(
//               onPressed: playSound,
//               icon: Icon(Icons.volume_up, size: 24),
//               label: Text("Listen", style: TextStyle(fontSize: 18)),
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 backgroundColor: Colors.green,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//               ),
//             ),
//
//             // Close Button
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text("Close", style: TextStyle(fontSize: 16, color: Colors.blue)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }