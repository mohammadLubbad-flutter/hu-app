import 'package:flutter/material.dart';

import 'package:hu/presentation/screens/main_screen.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  final List<String> imageList = [
    'images/explore1.jpg',
    'images/explore2.jpg',
    'images/explore3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  buildImageContainer(imageList[index], size),
                  buildIconButtonAlign(size, context),
                  buildTextContainer(
                      size, 'some informations about the image', context),
                ],
              );
            }),
      ]),
    );
  }

  Widget buildIconButtonAlign(Size size, BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(top: size.width * 0.05),
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            )),
      ),
    );
  }

  Widget buildTextContainer(Size size, String text, BuildContext context) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: size.height * 0.1,
      child: Container(
        height: size.height * 0.33,
        width: size.width,
        color: const Color.fromRGBO(0, 0, 0, 0.42),
        child: Text(
          text,
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Widget buildImageContainer(String image, Size size) {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ),
    );
  }
}
