import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import '../popover_bottomsheet_widget.dart';
import '../menu_widget.dart';
import '../person.dart';

class NarrowLayout extends StatelessWidget {
  NarrowLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: MenuWidget(
              alignment: Alignment.center,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final person = persons[index];
              return Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                elevation: 5,
                color: Colors.lightBlueAccent,
                child: ListTile(
                  title: Text(
                    '${person.name} ${person.surname}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(person.email),
                  leading: CircleAvatar(child: Image.asset(person.image)),
                  onTap: () {
                    showFlexibleBottomSheet(
                      minHeight: 0,
                      initHeight: 0.23,
                      maxHeight: 0.23,
                      context: context,
                      builder: _buildBottomSheet,
                      isSafeArea: true,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    );
                  },
                ),
              );
            },
            itemCount: persons.length,
          ),
        ),
      ],
    );
  }
}

Widget _buildBottomSheet(BuildContext context, ScrollController scrollController, double bottomSheetOffset) {
  return const BottomSheetListItems();
}