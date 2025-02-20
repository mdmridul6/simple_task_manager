import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lotties/empty_list.json',
        width: 400,
      ),
    );
  }
}
