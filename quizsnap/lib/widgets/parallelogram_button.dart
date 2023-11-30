import 'package:flutter/material.dart';

class ParallelogramButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final String side;
  final double width;
  final Color buttonColor;

  const ParallelogramButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.side,
    required this.width,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ParallelogramClipper(side: side),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          backgroundColor: buttonColor, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // No border radius
          ),
        ),
        child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Text(
              label,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class ParallelogramClipper extends CustomClipper<Path> {
  final String side; // Add the side parameter

  ParallelogramClipper({required this.side});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - (side == "left" ? 20 : 0), 0)
      ..lineTo(size.width, size.height)
      ..lineTo((side == "left" ? 20 : 0), size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
