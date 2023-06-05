import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projetomobile/tabs/home_tab2.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  const CategoryTile(this.snapshot, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(snapshot.get('icon')),
      ),
      title: Text(snapshot.get('title')),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {
        if (snapshot.get('title') == 'Blusas') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Container(color: Colors.amber),
            ),
          );
        }
        if (snapshot.get('title') == 'Camisas') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeTab2(),
            ),
          );
        }
        if (snapshot.get('title') == 'Conjuntos') {}
      },
    );
  }
}
