import 'package:flutter/material.dart';
import 'package:home_module_16/persons/person.dart';
import 'package:popover/popover.dart';
import '../popover_bottomsheet_widget.dart';

class ListTileWide extends StatelessWidget {
  Person person;
  ListTileWide({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      elevation: 5,
      color: Colors.lightBlueAccent,
      child: ListTile(
        title: Column(
          children: [
            Expanded(
              flex: 2,
              child: CircleAvatar(
                radius: 50,
                child: Image.asset(person.image),
              ),
            ),
            Expanded(
              flex: 1,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '${person.name} ${person.surname}\n',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    TextSpan(
                      text: person.email,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          showPopover(
            context: context,
            transitionDuration: const Duration(milliseconds: 100),
            bodyBuilder: (context) => const PopoverListItems(),
            onPop: () {},
            direction: PopoverDirection.bottom,
            width: 150,
            height: 150,
            arrowHeight: 15,
            arrowWidth: 30,
            arrowDxOffset: 40,
          );
        },
      ),
    );
  }
}
