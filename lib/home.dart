import 'package:flutter/material.dart';
import 'package:fluttoon/schedule_card.dart';

class Home extends StatelessWidget {
  Home({
    super.key,
  });

  final List<int> _days = [
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
  ];

  final List<String> _card01 = [
    'ALEX',
    'HELENA',
    'NANA',
  ];

  final List<String> _card02 = [
    'ME',
    'RICHARD',
    'CIRY',
    'ALEX',
    'HELENA',
    'DEN',
    'NANA',
    'MARK',
  ];

  final List<String> _card03 = [
    'DEN',
    'NANA',
    'MARK',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      foregroundImage: NetworkImage(
                          'https://d1telmomo28umc.cloudfront.net/media/public/avatars/kazzyan-avatar.jpg'),
                      radius: 35,
                    ),
                    Icon(
                      Icons.add,
                      size: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'monday 16'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var day in _days)
                        day == 16
                            ? Row(
                                children: [
                                  Text(
                                    'today'.toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                    ),
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.pink.shade200,
                                    size: 10,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  day.toString(),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ScheduleCard(
                backgroundColor: Colors.yellow,
                fromHour: '11',
                fromMin: '30',
                toHour: '12',
                toMin: '20',
                title: 'design\nmeeting'.toUpperCase(),
                cards: _card01,
              ),
              const SizedBox(
                height: 10,
              ),
              ScheduleCard(
                backgroundColor: Colors.purple,
                fromHour: '12',
                fromMin: '35',
                toHour: '14',
                toMin: '10',
                title: 'daily\nproject'.toUpperCase(),
                cards: _card02,
              ),
              const SizedBox(
                height: 10,
              ),
              ScheduleCard(
                backgroundColor: Colors.lime,
                fromHour: '15',
                fromMin: '00',
                toHour: '16',
                toMin: '30',
                title: 'weekly\nplanning'.toUpperCase(),
                cards: _card03,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
