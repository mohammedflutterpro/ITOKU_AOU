import 'package:flutter/material.dart';
import 'package:toku/model/inner_data.dart';

class Info_widget extends StatelessWidget {
   Info_widget({super.key, required this.Info});
  final ItemModel Info;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Info.color,
      height: 100,
      child: Row(
        children: [
          // Image.asset(Info.image),
          if (Info.image != null) Image.asset(Info.image!),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Info.japName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors
                          .black, // You can change the color for the glow effect
                      offset: Offset(1,
                          1), // Adjust the offset for different glowing effects
                    ),
                  ],
                ),
              ),
              Text(
                Info.EnName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          // IconButton(
          //   splashColor: Colors.red,
          //   onPressed: () {
          //     // player.play(AssetSource(Info.sound));
          //     Info.playsound();
          //   },
          //   icon: const Icon(
          //     Icons.play_arrow,
          //     color: Colors.white,
          //     size: 30,
          //   ),
          // ),
        ],
      ),
    );
  }
}
