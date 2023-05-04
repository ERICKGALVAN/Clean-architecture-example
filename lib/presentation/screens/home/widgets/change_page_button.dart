import 'package:flutter/material.dart';

class ChangePageButton extends StatelessWidget {
  const ChangePageButton({
    Key? key,
    required this.isLeft,
  }) : super(key: key);
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      padding: const EdgeInsets.all(
        10,
      ),
      child: Icon(
        isLeft ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
      ),
    );
  }
}
