import 'package:flutter/material.dart';

@immutable
class Notes {
  final String title;
  final String description;

  const Notes({
    required this.title,
    required this.description,
  });

  @override
  String toString() => 'Notes $title and $description';

  @override
  bool operator ==(covariant Notes other) =>
      title == other.title && description == other.description;

//* Object.hash(if i have more than one variable in my object)
  @override
  int get hashCode => Object.hash(
        title,
        description,
      );
}
