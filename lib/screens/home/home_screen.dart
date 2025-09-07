import 'package:flutter/material.dart';
import 'package:shopping_app_sprints/generated/l10n.dart';
import '../../models/product.dart';
import '../../models/offer.dart';
import 'widgets/home_appbar.dart';
import 'widgets/offers_carousel.dart';
import 'widgets/product_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      Product(
        title: S.of(context).sneakers,
        imageUrl: "https://eg.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/76/8679921/1.jpg?4806",
        price: 59.99,
        description: "Comfortable and stylish sneakers perfect for everyday wear.",
      ),
      Product(
        title: S.of(context).handbag,
        imageUrl: "https://m.media-amazon.com/images/I/713mffx+-GL._UY900_.jpg",
        price: 79.99,
        description: "Elegant hand bag made from premium materials.",
      ),
      Product(
        title: S.of(context).wristwatch,
        imageUrl: "https://image.made-in-china.com/202f0j00UdHcWqMgHEoD/Poedagar-615-Business-Casual-Wristwatch-Waterproof-Luminous-Date-Week-Men-s-Watch.webp",
        price: 199.99,
        description: "Luxury wrist watch with precision movement and sleek design.",
      ),
      Product(
        title: S.of(context).whitetshirt,
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWsLHv3JLXaPexfENcf3n7pQQKg9V3pIQ6Pw&s",
        price: 29.99,
        description: "Classic white t-shirt made from soft, breathable cotton.",
      ),
    ];

    final offers = List.generate(
      3,
      (i) => Offer(
        title: "${S.of(context).special_offer} ${i + 1}",
        description: "Save up to 50% on item ${i + 1}",
        imageUrl: "https://www.shutterstock.com/image-photo/cartons-shopping-cart-on-laptop-260nw-569126122.jpg",
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xfff6f7fb),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: HomeAppBar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OffersCarousel(offers: offers),
            const SizedBox(height: 24),
            Text(
              S.of(context).products,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ProductGrid(products: products),
          ],
        ),
      ),
    );
  }
}
