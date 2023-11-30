import 'package:flutter/material.dart';

class ParallelogramButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const ParallelogramButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ParallelogramClipper(),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          backgroundColor: const Color(0xFF4A90E2), // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // No border radius
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Text(label),
        ),
      ),
    );
  }
}

class ParallelogramClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - 20, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(20, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
