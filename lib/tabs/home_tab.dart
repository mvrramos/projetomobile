import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildBodyBack() => Container(
          color: const Color.fromARGB(100, 20, 18, 18),
        );

    return Stack(
      children: <Widget>[
        buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Produtos"),
                centerTitle: true,
              ),
            ),
            FutureBuilder<List<String>>(
              future: _getImageUrls(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: const Text('Erro ao carregar os dados.'),
                    ),
                  );
                } else if (snapshot.hasData) {
                  final imageUrls = snapshot.data!;

                  return SliverGrid.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                    children: imageUrls.map(
                      (imageUrl) {
                        return Container(
                          margin: const EdgeInsets.all(4),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            filterQuality:
                                FilterQuality.low, // Ajuste a qualidade aqui
                          ),
                        );
                      },
                    ).toList(),
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: const Text("Nenhuma imagem encontrada."),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ],
    );
  }

  Future<List<String>> _getImageUrls() async {
    final storageRef = FirebaseStorage.instance.ref().child('/');
    final ListResult result = await storageRef.listAll();

    final List<Reference> allFiles = result.items;

    final List<String> imageUrls = await Future.wait(
      allFiles.map((fileRef) => fileRef.getDownloadURL()).toList(),
    );

    return imageUrls;
  }
}
