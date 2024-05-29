import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final String fromHour, fromMin, toHour, toMin, title;
  final Color backgroundColor;

  final List<String> cards;

  const ScheduleCard({
    super.key,
    required this.fromHour,
    required this.fromMin,
    required this.toHour,
    required this.toMin,
    required this.title,
    required this.backgroundColor,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        //height: 200,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: fromHour,
                    style: const TextStyle(fontSize: 20),
                    children: [
                      TextSpan(
                        text: '\n$fromMin',
                        style: const TextStyle(
                          fontSize: 14,
                          height: 0.7,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  '|',
                  style: TextStyle(fontSize: 20),
                ),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: toHour,
                    style: const TextStyle(fontSize: 20),
                    children: [
                      TextSpan(
                        text: '\n$toMin',
                        style: const TextStyle(
                          fontSize: 14,
                          height: 0.7,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 50,
                      height: 0.9,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (var card in cards.take(3))
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            card,
                            style: TextStyle(
                              color:
                                  card == 'ME' ? Colors.black : Colors.black26,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      cards.length > 3
                          ? Text(
                              '+${cards.length - 3}',
                              style: const TextStyle(
                                color: Colors.black26,
                                fontSize: 18,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
