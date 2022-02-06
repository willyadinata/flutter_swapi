import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SizedBox(
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
          ),
          height: 20.0,
          width: 20.0,
        ),
      ),
    );
  }
}
