// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';

// class ProductsTab extends StatelessWidget {
//   const ProductsTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         CustomScrollView(
//           slivers: [
//             FutureBuilder(
//               future: _getImageUrls(),
//               builder: (context, snapshot) {
//                 FutureBuilder<List<String>>(
//                   future: _getImageUrls(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return SliverToBoxAdapter(
//                         child: Container(
//                           height: 200,
//                           alignment: Alignment.center,
//                           child: const CircularProgressIndicator(
//                             valueColor:
//                                 AlwaysStoppedAnimation<Color>(Colors.white),
//                           ),
//                         ),
//                       );
//                     } else if (snapshot.hasError) {
//                       return SliverToBoxAdapter(
//                         child: Container(
//                           height: 200,
//                           alignment: Alignment.center,
//                           child: const Text('Erro ao carregar os dados.'),
//                         ),
//                       );
//                     } else if (snapshot.hasData) {
//                       final imageUrls = snapshot.data!;

//                       return SliverGrid.count(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 1.0,
//                         mainAxisSpacing: 1.0,
//                         children: imageUrls.map(
//                           (imageUrl) {
//                             return Container(
//                               margin: const EdgeInsets.all(4),
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[200],
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(8),
//                                 child: CachedNetworkImage(
//                                   imageUrl: imageUrl,
//                                   fit: BoxFit.cover,
//                                   filterQuality: FilterQuality
//                                       .low, // Ajuste a qualidade aqui
//                                   placeholder: (context, url) => const Center(
//                                       child: CircularProgressIndicator()),
//                                   errorWidget: (context, url, error) =>
//                                       const Icon(Icons.error),
//                                 ),
//                               ),
//                             );
//                           },
//                         ).toList(),
//                       );
//                     } else {
//                       return SliverToBoxAdapter(
//                         child: Container(
//                           height: 200,
//                           alignment: Alignment.center,
//                           child: const Text("Nenhuma imagem encontrada."),
//                         ),
//                       );
//                     }
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Future<List<String>> _getImageUrls() async {
//     final storageRef = FirebaseStorage.instance.ref().child('/');
//     final ListResult result = await storageRef.listAll();

//     final List<Reference> allFiles = result.items;

//     final List<String> imageUrls = await Future.wait(
//       allFiles.map((fileRef) => fileRef.getDownloadURL()).toList(),
//     );

//     return imageUrls;
//   }
// }
