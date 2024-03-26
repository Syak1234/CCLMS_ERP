import 'package:flutter/material.dart';

class ListX extends StatefulWidget {
  const ListX({super.key});

  @override
  State<ListX> createState() => _ListXState();
}

class _ListXState extends State<ListX> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ListView.custom(
            shrinkWrap: true,
            // physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            childrenDelegate: SliverChildListDelegate(
              [
                ListView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => const ListTile(
                    leading: Icon(Icons.map),
                    title: Text('Map'),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text('Album'),
                ),
                const ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
