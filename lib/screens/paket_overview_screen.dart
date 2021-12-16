import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PaketOverviewScreen extends StatelessWidget {
  const PaketOverviewScreen({Key? key}) : super(key: key);
  static const routeName = '/overview';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/detail');
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        child: Image.network(
                          'https://images.weddingku.com/images/upload/store/product/big/638-hlco2sree8g0.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 250,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 50,
                            child: Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Paket 1',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    'Rp.1.000.000',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
