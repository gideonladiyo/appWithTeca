import 'dart:async';
import 'package:chatapp/pages/spotify/view/spotify_home.dart';
import 'package:flutter/material.dart';

class RowTwo extends StatefulWidget {
  const RowTwo({super.key});

  @override
  State<RowTwo> createState() => _CountDaysState();
}

class _CountDaysState extends State<RowTwo> {
  late Timer _timer;
  late Duration _timeElapsed;

  DateTime startTime = DateTime(2024, 8, 3, 21, 0, 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timeElapsed = Duration();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeElapsed = DateTime.now().difference(startTime);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int days = _timeElapsed.inDays;
    int hours = _timeElapsed.inHours % 24;
    int minutes = _timeElapsed.inMinutes % 60;
    int seconds = _timeElapsed.inSeconds % 60;
    var width = MediaQuery.of(context).size.width - 50;
    double leftWidth = width * 0.57575757;
    double rightWidth = width * 0.372727272;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Container(
            height: 150,
            width: leftWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade300,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 15,
                  offset: Offset(0, 10)
                )
              ],
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(7),
                child: Column(
                  children: [
                    Text(
                      "$days Days",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.access_time_sharp,
                          color: Colors.black,
                          size: 50,
                        ),
                        const SizedBox(width: 10,),
                        Text(
                          "$hours:$minutes:$seconds",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "We Together",
                      style: TextStyle(
                        fontSize: 20
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 17,),
          GestureDetector(
            child: Container(
              height: 123,
              width: rightWidth,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade500.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 15,
                      offset: Offset(0, 10)
                  )
                ],
              ),
              child: Center(
                child: Image.asset(
                  "assets/logo/spotify-logo.png"
                ),
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SpotifyHome()));
            },
          )
        ],
      ),
    );
  }
}
