import 'package:flutter/material.dart';
import 'package:germany_app/componats/TunsItem.dart';
import 'package:germany_app/screen/TunsComponat.dart';
import 'package:germany_app/screen/home.dart';
import 'package:germany_app/screen/test.dart';
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
        image: "assets/images/d-cartoon-back-school-23-2151676608.png",
        titel: "Welcome to Language Learning App – Germany Edition ",
        body: "Master German with Fun and Interactive Lessons"),
    OnBordingMode(
        image: "assets/images/photo2.png",
        titel: "How Language Learning App Works ",
        body: "Step-by-Step Guide to Learning German"),
    OnBordingMode(
        image: "assets/images/photo3.png",
        titel: "Interactive Features for Learning German ",
        body:
            " Boost Your Fluency with Lessons, Quizzes, and Pronunciation Practice"),
  ];

  var bordarController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SizedBox(
        width: width(context),
        height: hight(context) * .8,
        child: PageView.builder(
          controller: bordarController,
          onPageChanged: (int index) {
            if (index == onBording.length - 1) {
              print('last');
              setState(() {
                isLast = true;
              });
            } else {
              setState(() {
                isLast = false;
              });
            }
          },
          itemBuilder: (context, index) => OnBording(onBording[index]),
          itemCount: onBording.length,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      somtheIndecator(),
      Spacer(),
      isLast
          ? IsLast()
          : Row(
              children: [
                Elvaeteditem(
                  text: 'Skip',
                  onpreesed: () {},
                ),
                Spacer(),
                Elvaeteditem(
                    text: 'Next',
                    onpreesed: () {
                      bordarController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.decelerate);
                    })
              ],
            ),
    ]));
  }

  Row somtheIndecator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmoothPageIndicator(
          controller: bordarController,
          count: onBording.length,
          effect: ExpandingDotsEffect(
              dotColor: Colors.grey,
              activeDotColor: Colors.orange,
              dotHeight: 10,
              dotWidth: 20,
              radius: 8,
              spacing: 4),
        ),
      ],
    );
  }

  Column OnBording(OnBordingMode model) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: Image(
              image: AssetImage(
                model.image,
              ),
              width: 400,
              height: 500,
              fit: BoxFit.cover),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          textAlign: TextAlign.center,
          model.titel,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(model.body,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )),
      ],
    );
  }

  Row IsLast() {
    return Row(
      children: [
        Elvaeteditem(
          text: 'Register',
          onpreesed: () {},
        ),
        const Spacer(),
        Elvaeteditem(
          text: 'Login',
          onpreesed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Tunsitem()));
          },
        )
      ],
    );
  }
}

class Elvaeteditem extends StatelessWidget {
  const Elvaeteditem({
    super.key,
    this.onpreesed,
    required this.text,
  });
  final dynamic onpreesed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
        ),
        onPressed: onpreesed,
        child: Text(text));
  }
}
