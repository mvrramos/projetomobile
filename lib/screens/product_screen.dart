import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projetomobile/datas/product_data.dart';
import 'package:projetomobile/tiles/product_tile.dart';

class ProductScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  const ProductScreen(this.snapshot, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(snapshot.get("title")),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('camisas').get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator.adaptive();
            } else {
              return TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  GridView.builder(
                    padding: const EdgeInsets.all(4),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductTile(
                          "grid",
                          ProductData.fromDocument(
                              snapshot.data.documents[index]));
                    },
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.all(4),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductTile(
                          "list",
                          ProductData.fromDocument(
                              snapshot.data.documents[index]));
                    },
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
