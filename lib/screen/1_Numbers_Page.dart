import 'package:flutter/material.dart';

import '../Compononets/button.dart';

class NumbersPage extends StatelessWidget {
  const NumbersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Numbers',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 120,
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
                          child: Text(' ${index + 1}',
                          style: TextStyle(fontSize: 50),),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${index + 1}'),
                            SizedBox(height: 10),
                            Text(
                              'explain the number ${index + 1}',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: Text('إغلاق'),
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
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        )

        // body: ListView(
        //   children: [
        //     the_row(
        //         Info: ItemModel(
        //             image: 'assets/numbers/2cars.png',
        //             EnName: 'Five',
        //             japName: 'Go',
        //             color: Colors.red,
        //             sound:
        //                 'sounds/toku-assets-sounds-numbers-number_five_sound.mp3')),
        //     the_row(
        //         Info: ItemModel(
        //             image: 'assets/numbers/4cars.png',
        //             EnName: 'Eight',
        //             japName: 'Hachi',
        //             color: Colors.blue,
        //             sound:
        //                 'sounds/toku-assets-sounds-numbers-number_eight_sound.mp3')),
        //     the_row(
        //         Info: ItemModel(
        //             image: 'assets/numbers/4cars.png',
        //             EnName: 'Eight',
        //             japName: 'Hachi',
        //             color: Colors.blue,
        //             sound:
        //                 'sounds/toku-assets-sounds-numbers-number_eight_sound.mp3')),
        //     the_row(
        //         Info: ItemModel(
        //             image: 'assets/numbers/4cars.png',
        //             EnName: 'Eight',
        //             japName: 'Hachi',
        //             color: Colors.blue,
        //             sound:
        //                 'sounds/toku-assets-sounds-numbers-number_eight_sound.mp3')),
        //     the_row(
        //         Info: ItemModel(
        //             image: 'assets/numbers/4cars.png',
        //             EnName: 'Eight',
        //             japName: 'Hachi',
        //             color: Colors.blue,
        //             sound:
        //                 'sounds/toku-assets-sounds-numbers-number_eight_sound.mp3')),
        //     the_row(
        //         Info: ItemModel(
        //             image: 'assets/numbers/4cars.png',
        //             EnName: 'Eight',
        //             japName: 'Hachi',
        //             color: Colors.blue,
        //             sound:
        //                 'sounds/toku-assets-sounds-numbers-number_eight_sound.mp3')),
        //     the_row(
        //         Info: ItemModel(
        //             image: 'assets/numbers/4cars.png',
        //             EnName: 'Eight',
        //             japName: 'Hachi',
        //             color: Colors.blue,
        //             sound:
        //                 'sounds/toku-assets-sounds-numbers-number_eight_sound.mp3')),
        //     the_row(
        //         Info: ItemModel(
        //             image: 'assets/numbers/4cars.png',
        //             EnName: 'Eight',
        //             japName: 'Hachi',
        //             color: Colors.blue,
        //             sound:
        //                 'sounds/toku-assets-sounds-numbers-number_eight_sound.mp3')),
        //     the_row(
        //         Info: ItemModel(
        //             image: 'assets/numbers/4cars.png',
        //             EnName: 'Eight',
        //             japName: 'Hachi',
        //             color: Colors.blue,
        //             sound:
        //                 'sounds/toku-assets-sounds-numbers-number_eight_sound.mp3')),
        //     the_row(
        //         Info: ItemModel(
        //             image: 'assets/numbers/4cars.png',
        //             EnName: 'Eight',
        //             japName: 'Hachi',
        //             color: Colors.blue,
        //             sound:
        //                 'sounds/toku-assets-sounds-numbers-number_eight_sound.mp3')),
        //     the_row(
        //         Info: ItemModel(
        //             image: 'assets/numbers/4cars.png',
        //             EnName: 'Eight',
        //             japName: 'Hachi',
        //             color: Colors.blue,
        //             sound:
        //                 'sounds/toku-assets-sounds-numbers-number_eight_sound.mp3')),
        //     the_row(
        //         Info: ItemModel(
        //             image: 'assets/numbers/4cars.png',
        //             EnName: 'Eight',
        //             japName: 'Hachi',
        //             color: Colors.blue,
        //             sound:
        //                 'sounds/toku-assets-sounds-numbers-number_eight_sound.mp3')),
        //     the_row(
        //         Info: ItemModel(
        //             image: 'assets/numbers/4cars.png',
        //             EnName: 'Eight',
        //             japName: 'Hachi',
        //             color: Colors.blue,
        //             sound:
        //                 'sounds/toku-assets-sounds-numbers-number_eight_sound.mp3')),
        //     the_row(
        //         Info: ItemModel(
        //             image: 'assets/numbers/4cars.png',
        //             EnName: 'Eight',
        //             japName: 'Hachi',
        //             color: Colors.blue,
        //             sound:
        //                 'sounds/toku-assets-sounds-numbers-number_eight_sound.mp3')),
        //     the_row(
        //         Info: ItemModel(
        //             image: 'assets/numbers/4cars.png',
        //             EnName: 'Eight',
        //             japName: 'Hachi',
        //             color: Colors.blue,
        //             sound:
        //                 'sounds/toku-assets-sounds-numbers-number_eight_sound.mp3')),
        //   ],
        // ),
        );
  }
}
