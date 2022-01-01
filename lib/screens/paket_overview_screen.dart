import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/admin_list.dart';
import '../providers/pakets.dart';
import '../screens/edit_paket_screen.dart';

class PaketOverviewScreen extends StatefulWidget {
  const PaketOverviewScreen({Key? key}) : super(key: key);
  static const routeName = '/overview';

  @override
  State<PaketOverviewScreen> createState() => _PaketOverviewScreenState();
}

class _PaketOverviewScreenState extends State<PaketOverviewScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Pakets>(context).fetchAndSetPakets().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All Package'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  EditPaketScreen.routeName,
                );
              },
            ),
          ],
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const AdminList(),
      ),
    );
  }
}
