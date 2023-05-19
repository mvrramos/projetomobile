import 'package:flutter/material.dart';
import 'package:projetomobile/widgets/custom_drawer.dart';

class HomeTab2 extends StatelessWidget {
  const HomeTab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildBodyBack() => Container(
          // color: const Color.fromRGBO(20, 18, 18, 100),
          color: Colors.black,
        );

    return Scaffold(
      drawer:
          const CustomDrawer(), // Utilize o CustomDrawer do arquivo custom_drawer.dart
      body: Stack(
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
              SliverGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
                children: _getImageUrls().map(
                  (imageUrl) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                        filterQuality:
                            FilterQuality.low, // Ajuste a qualidade aqui
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<String> _getImageUrls() {
    // Lista de caminhos das imagens no diretório 'assets'
    return [
      'assets/alemanha1.jpg',
      'assets/alemanha2.jpg',
      'assets/argentina1.jpg',
      'assets/argentina2.jpg',
      'assets/bayern1.jpg',
      'assets/bayern2.jpg',
      'assets/botafogo1.jpg',
      'assets/botafogo2.jpg',
      'assets/chelsea1.jpg',
      'assets/chelsea2.jpg',
      'assets/city1.jpg',
      'assets/city2.jpg',
      'assets/corinthians1.jpg',
      'assets/corinthians2.jpg',
      'assets/flamengo1.jpg',
      'assets/flamengo2.jpg',
      'assets/fluminense1.jpg',
      'assets/fluminense2.jpg',
      'assets/marsella1.jpg',
      'assets/marsella2.jpg',
      'assets/psg1.jpg',
      'assets/psg2.jpg',
      // Adicione mais caminhos das imagens conforme necessário
    ];
  }
}
