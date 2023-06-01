import 'package:flutter/material.dart';
import 'package:projetomobile/widgets/custom_drawer.dart';

class HomeTab2 extends StatelessWidget {
  final _pageController = PageController();

  HomeTab2({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildBodyBack() => Container(
          color: Colors.black,
        );

    return Scaffold(
      drawer: CustomDrawer(_pageController),
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
                children: _getImageWidgets(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<String> _getImageUrls() {
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
    ];
  }

  List<Widget> _getImageWidgets() {
    return _getImageUrls().map((imageUrl) {
      return Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            cacheWidth:
                300, // Defina a largura desejada para otimizar o carregamento
            cacheHeight:
                300, // Defina a altura desejada para otimizar o carregamento
          ),
        ),
      );
    }).toList();
  }
}
