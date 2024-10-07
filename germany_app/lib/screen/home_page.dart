import 'package:flutter/material.dart';
import 'package:germany_app/componats/TunsItem.dart';
import 'package:germany_app/screen/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingMode {
  String image;
  String titel;
  String body;
  OnBordingMode({required this.image, required this.titel, required this.body});
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<OnBordingMode> onBording = [
    OnBordingMode(
        image: "assets/images/R.png",
        titel: "Learn With me ",
        body: "Screen 1"),
    OnBordingMode(
        image: "assets/images/OIP.jpeg",
        titel: "Learn With your frind ",
        body: "Screen 2"),
    OnBordingMode(
        image: "assets/images/german-apps.jpg",
        titel: "Learn germany ",
        body: "Screen 3"),
  ];

  var bordarController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  if (value == onBording.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: bordarController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buldiBordingItem(onBording[index]),
                itemCount: onBording.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: bordarController,
                  count: onBording.length,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.blue,
                      dotColor: Colors.grey,
                      dotHeight: 5,
                      dotWidth: 10,
                      spacing: 5.0,
                      expansionFactor: 4),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    if (isLast) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tunsitem()),
                      );
                    } else {
                      bordarController.nextPage(
                          duration: Duration(milliseconds: 700),
                          curve: Curves.fastEaseInToSlowEaseOut);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buldiBordingItem(OnBordingMode item) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(
              (item.image),
            ),
            fit: BoxFit.fill,
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            item.titel,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            item.body,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      );
}
