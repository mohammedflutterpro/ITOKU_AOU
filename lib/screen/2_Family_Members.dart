import 'package:flutter/material.dart';
import 'package:toku/Compononets/Info_widget.dart';
import 'package:toku/model/inner_data.dart';

class FamilyMembers extends StatelessWidget {
  FamilyMembers();

  // List of family members data with English pronunciation (romaji)
  final List<Map<String, String>> familyMembers = [
    {
      "EnName": "Father",
      "japName": "Otousan",
      "image": "assets/numbers/one.jpg",
      "sound": "sound1"
    },
    {
      "EnName": "Mother",
      "japName": "Okaasan",
      "image": "assets/numbers/two.jpg",
      "sound": "sound2"
    },
    {
      "EnName": "Brother",
      "japName": "Ani",
      "image": "assets/numbers/three.jpg",
      "sound": "sound3"
    },
    {
      "EnName": "Sister",
      "japName": "Imouto",
      "image": "assets/numbers/four.jpg",
      "sound": "sound4"
    },
    {
      "EnName": "Grandfather",
      "japName": "Ojiisan",
      "image": "assets/numbers/five.jpg",
      "sound": "sound5"
    },
    {
      "EnName": "Grandmother",
      "japName": "Okaasan",
      "image": "assets/numbers/six.jpg",
      "sound": "sound6"
    },
    {
      "EnName": "Uncle",
      "japName": "Ojisan",
      "image": "assets/numbers/seven.jpg",
      "sound": "sound7"
    },
    {
      "EnName": "Aunt",
      "japName": "Obasan",
      "image": "assets/numbers/eight.jpg",
      "sound": "sound8"
    },
    {
      "EnName": "Cousin (Male)",
      "japName": "Itoko (Otoko)",
      "image": "assets/numbers/nine.jpg",
      "sound": "sound9"
    },
    {
      "EnName": "Cousin (Female)",
      "japName": "Itoko (Onna)",
      "image": "assets/numbers/ten.jpg",
      "sound": "sound10"
    },
    {
      "EnName": "Nephew",
      "japName": "Otokonoko",
      "image": "assets/numbers/eleven.jpg",
      "sound": "sound11"
    },
    {
      "EnName": "Niece",
      "japName": "Onnanoko",
      "image": "assets/numbers/twelve.jpg",
      "sound": "sound12"
    },
    {
      "EnName": "Son",
      "japName": "Musuko",
      "image": "assets/numbers/thirteen.jpg",
      "sound": "sound13"
    },
    {
      "EnName": "Daughter",
      "japName": "Musume",
      "image": "assets/numbers/fourteen.jpg",
      "sound": "sound14"
    },
    {
      "EnName": "Father-in-law",
      "japName": "Giri no Chichi",
      "image": "assets/numbers/fifteen.jpg",
      "sound": "sound15"
    },
    {
      "EnName": "Mother-in-law",
      "japName": "Giri no Haha",
      "image": "assets/numbers/sixteen.jpg",
      "sound": "sound16"
    },
    {
      "EnName": "Husband",
      "japName": "Otto",
      "image": "assets/numbers/seventeen.jpg",
      "sound": "sound17"
    },
    {
      "EnName": "Wife",
      "japName": "Tsuma",
      "image": "assets/numbers/eighteen.jpg",
      "sound": "sound18"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: double.maxFinite,
        title: Text(
          'Family Members',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Adjust this for how many columns you want
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: familyMembers.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Center(
                        child: Text(
                          familyMembers[index]["EnName"]!,
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Display the image
                          Image.asset(
                            familyMembers[index]["image"]!,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          // Display the English pronunciation (romaji)
                          Text(
                            familyMembers[index]["japName"]!, // Romaji name
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: 100, // Fixed width for square shape
                height: 100, // Fixed height for square shape
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  familyMembers[index]["EnName"]!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
