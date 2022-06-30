import 'package:flutter/material.dart';
import 'listtile_widget.dart';
import '../menu_widget.dart';
import '../person.dart';

class WideLayout extends StatelessWidget {
  const WideLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.topCenter,
            child: MenuWidget(
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: GridView.count(
            crossAxisCount: 3,
            // childAspectRatio: 8,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              ...persons
                  .map((person) => ListTileWide(person: person))
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
