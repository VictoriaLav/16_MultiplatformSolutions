import 'package:flutter/material.dart';

class PopoverListItems extends StatelessWidget {
  const PopoverListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scrollbar(
      child: ListItems(),
    );
  }
}

class BottomSheetListItems extends StatelessWidget {
  const BottomSheetListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: const ListItems(),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          InkWell(
            child: SizedBox(
              height: 30,
              child: Row(
                children: const [
                  Icon(Icons.person),
                  SizedBox(width: 5),
                  Text(
                    'VIEW PROFILE',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const Divider(color: Colors.black),
          InkWell(
            child: SizedBox(
              height: 30,
              child: Row(
                children: const [
                  Icon(Icons.people),
                  SizedBox(width: 5),
                  Text(
                    'FRIENDS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const Divider(color: Colors.black),
          InkWell(
            child: SizedBox(
              height: 30,
              child: Row(
                children: const [
                  Icon(Icons.fact_check),
                  SizedBox(width: 5),
                  Text(
                    'REPORT',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}