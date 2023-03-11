import 'package:flutter/material.dart' show Color;

class Course {
  final String title, description, iconSrc;
  final Color color;

  Course({
    required this.title,
    this.description = '11111',
    this.iconSrc = "assets/icons/ios.svg",
    this.color = const Color(0xFF7553F6),
  });
}

final List<Course> recentCourses = [
  Course(title: "amar"),
  Course(
    title: "adel",
    color: const Color(0xFF9CC5FF),
    iconSrc: "assets/icons/code.svg",
  ),
  Course(title: "zahran"),
  Course(
    title: "rashad",
    color: const Color(0xFF9CC5FF),
    iconSrc: "assets/icons/code.svg",
  ),
];
