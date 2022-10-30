import 'package:flutter/material.dart';

class IterableListView<T> extends StatelessWidget {
  final Iterable<T> iterableList;
  const IterableListView({
    super.key,
    required this.iterableList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: iterableList.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          iterableList.elementAt(index).toString(),
        ),
      ),
    );
  }
}
