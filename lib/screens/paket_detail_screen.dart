import 'package:flutter/material.dart';

class PaketDetailScreen extends StatelessWidget {
  const PaketDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                'https://images.weddingku.com/images/upload/store/product/big/638-hlco2sree8g0.jpg',
              ),
            ),
           //start
          Container(
              height: 150,
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.network(
                        'https://picsum.photos/250?image=9',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 50,
                            child: Center(child: Text('abc')),
                          ),
                          Expanded(flex: 25, child: Text('def')),
                          Expanded(flex: 25, child: Text('ghi')),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
           //end
          ],
        ),
      ),
    );
  }
}
