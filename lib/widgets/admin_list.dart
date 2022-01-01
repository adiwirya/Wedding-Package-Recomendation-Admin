import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/pakets.dart';
import './admin_item_card.dart';

class AdminList extends StatelessWidget {
  const AdminList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paketData = Provider.of<Pakets>(context);
    final pakets = paketData.pakets;
    return ListView.builder(
      itemCount: pakets.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: pakets[i],
        child: const AdminItemCard(),
      ),
    );
  }
}