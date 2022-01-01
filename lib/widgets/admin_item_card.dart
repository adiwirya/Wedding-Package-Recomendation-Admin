import 'package:admin_app/screens/edit_paket_screen.dart';
import 'package:admin_app/screens/paket_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/pakets.dart';

class AdminItemCard extends StatelessWidget {
  const AdminItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var priceFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    final paket = Provider.of<Paket>(context, listen: false);
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(paket.image),
        ),
        title: Text(paket.nama),
        subtitle: Text(
          priceFormat.format(paket.harga),
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    EditPaketScreen.routeName,
                    arguments: paket.id,
                  );
                },
                color: Theme.of(context).primaryColor,
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text('Do you want to delete this item?'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                          },
                        ),
                        TextButton(
                          child: const Text('Yes'),
                          onPressed: () async{
                            await Provider.of<Pakets>(context, listen: false)
                                .deleteItem(paket.id);
                            Navigator.of(ctx).pop(true);
                            Navigator.of(ctx)
                                .pushReplacementNamed(PaketOverviewScreen.routeName);
                          },
                        ),
                      ],
                    ),
                  );
                },
                color: Theme.of(context).errorColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
