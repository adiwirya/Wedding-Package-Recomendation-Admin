import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/pakets.dart';
import '../screens/paket_overview_screen.dart';

class EditPaketScreen extends StatefulWidget {
  static const routeName = '/edit-paket';
  EditPaketScreen({Key? key}) : super(key: key);

  @override
  _EditPaketScreenState createState() => _EditPaketScreenState();
}

class _EditPaketScreenState extends State<EditPaketScreen> {
  final _form = GlobalKey<FormState>();
  final _hargaFocus = FocusNode();
  final _tipeVenueFocus = FocusNode();
  final _lokasiFocus = FocusNode();
  final _tamuFocus = FocusNode();
  final _imageFocus = FocusNode();
  final _crewFocus = FocusNode();
  final _cakeFocus = FocusNode();
  final _carFocus = FocusNode();
  final _mcFoucs = FocusNode();
  final _singerFocus = FocusNode();
  final _insFocus = FocusNode();
  final _photographerFocus = FocusNode();
  final _videographerFocus = FocusNode();
  final _hourFocus = FocusNode();
  final _stageFocus = FocusNode();
  final _gateFocus = FocusNode();
  final _tableFocus = FocusNode();
  final _muaFocus = FocusNode();
  final _groomFocus = FocusNode();
  final _brideFocus = FocusNode();
  final _liveFocus = FocusNode();
  final _venueFocus = FocusNode();
  final _detailFocus = FocusNode();

  var _isInit = true;
  var _isLoading = false;

  var _editedpaket = Paket(
    id: '',
    nama: '',
    harga: 0,
    venueType: '',
    lokasi: '',
    tamu: 0,
    image: '',
    mc: 0,
    car: 0,
    photo: 0,
    video: 0,
    hour: 0,
    crew: 0,
    cake: 0,
    singer: 0,
    ins: 0,
    mua: 0,
    catering: 0,
    stage: 0,
    gate: 0,
    table: 0,
    groom: 0,
    bride: 0,
    live: 0,
    venue: 0,
    detail: '',
  );

  var _initValues = {
    'nama': '',
    'harga': '',
    'venueType': '',
    'lokasi': '',
    'tamu': '',
    'image': '',
    'mc': '',
    'car': '',
    'photo': '',
    'video': '',
    'hour': '',
    'crew': '',
    'cake': '',
    'singer': '',
    'ins': '',
    'mua': '',
    'catering': '',
    'stage': '',
    'gate': '',
    'table': '',
    'groom': '',
    'bride': '',
    'live': '',
    'venue': '',
    'detail': '',
  };

  @override
  void dispose() {
    _hargaFocus.dispose();
    _tipeVenueFocus.dispose();
    _lokasiFocus.dispose();
    _tamuFocus.dispose();
    _imageFocus.dispose();
    _crewFocus.dispose();
    _cakeFocus.dispose();
    _carFocus.dispose();
    _mcFoucs.dispose();
    _singerFocus.dispose();
    _insFocus.dispose();
    _photographerFocus.dispose();
    _videographerFocus.dispose();
    _hourFocus.dispose();
    _stageFocus.dispose();
    _gateFocus.dispose();
    _tableFocus.dispose();
    _muaFocus.dispose();
    _groomFocus.dispose();
    _brideFocus.dispose();
    _liveFocus.dispose();
    _venueFocus.dispose();
    _detailFocus.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState?.save();
    setState(() {
      _isLoading = true;
    });
    print(_editedpaket.id);
    if (_editedpaket.id != '') {
      final message = await Provider.of<Pakets>(context, listen: false)
          .updateItem(_editedpaket.id, _editedpaket);
      if (message == null) {
        return;
      } else if (message == "Data Updated") {
        Navigator.of(context).pushNamedAndRemoveUntil(
            PaketOverviewScreen.routeName, (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
        ));
      }
    } else {
      final message = await Provider.of<Pakets>(context, listen: false)
          .addItem(_editedpaket);
      if (message == null) {
        return;
      } else if (message == "Data Created") {
        Navigator.of(context).pushNamedAndRemoveUntil(
            PaketOverviewScreen.routeName, (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
        ));
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final paketId = ModalRoute.of(context)?.settings.arguments as String;
        if (paketId != "null") {
          _editedpaket =
              Provider.of<Pakets>(context, listen: false).findById(paketId);
          _initValues = {
            'nama': _editedpaket.nama,
            'harga': _editedpaket.harga.toString(),
            'venueType': _editedpaket.venueType,
            'lokasi': _editedpaket.lokasi,
            'tamu': _editedpaket.tamu.toString(),
            'image': _editedpaket.image,
            'mc': _editedpaket.mc.toString(),
            'car': _editedpaket.car.toString(),
            'photo': _editedpaket.photo.toString(),
            'video': _editedpaket.video.toString(),
            'hour': _editedpaket.hour.toString(),
            'crew': _editedpaket.crew.toString(),
            'cake': _editedpaket.cake.toString(),
            'singer': _editedpaket.singer.toString(),
            'ins': _editedpaket.ins.toString(),
            'mua': _editedpaket.mua.toString(),
            'catering': _editedpaket.catering.toString(),
            'stage': _editedpaket.stage.toString(),
            'gate': _editedpaket.gate.toString(),
            'table': _editedpaket.table.toString(),
            'groom': _editedpaket.groom.toString(),
            'bride': _editedpaket.bride.toString(),
            'live': _editedpaket.live.toString(),
            'venue': _editedpaket.venue.toString(),
            'detail': _editedpaket.detail,
          };
        }
      }
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Paket'),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _saveForm,
            ),
          ],
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _form,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          initialValue: _initValues['nama'],
                          decoration: const InputDecoration(
                            labelText: 'Nama Paket',
                            hintText: 'eg. Wedding Package A',
                          ),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_hargaFocus);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a nama.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedpaket = Paket(
                              id: _editedpaket.id,
                              nama: value!,
                              harga: _editedpaket.harga,
                              venueType: _editedpaket.venueType,
                              lokasi: _editedpaket.lokasi,
                              tamu: _editedpaket.tamu,
                              image: _editedpaket.image,
                              mc: _editedpaket.mc,
                              car: _editedpaket.car,
                              photo: _editedpaket.photo,
                              video: _editedpaket.video,
                              hour: _editedpaket.hour,
                              crew: _editedpaket.crew,
                              cake: _editedpaket.cake,
                              singer: _editedpaket.singer,
                              ins: _editedpaket.ins,
                              mua: _editedpaket.mua,
                              catering: _editedpaket.catering,
                              stage: _editedpaket.stage,
                              gate: _editedpaket.gate,
                              table: _editedpaket.table,
                              groom: _editedpaket.groom,
                              bride: _editedpaket.bride,
                              live: _editedpaket.live,
                              venue: _editedpaket.venue,
                              detail: _editedpaket.detail,
                            );
                          },
                        ),
                        TextFormField(
                          initialValue: _initValues['harga'],
                          focusNode: _hargaFocus,
                          decoration: const InputDecoration(
                            labelText: 'Harga Paket',
                            hintText: 'without Rp and comma',
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_tipeVenueFocus);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a harga.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedpaket = Paket(
                              id: _editedpaket.id,
                              nama: _editedpaket.nama,
                              harga: int.parse(value!),
                              venueType: _editedpaket.venueType,
                              lokasi: _editedpaket.lokasi,
                              tamu: _editedpaket.tamu,
                              image: _editedpaket.image,
                              mc: _editedpaket.mc,
                              car: _editedpaket.car,
                              photo: _editedpaket.photo,
                              video: _editedpaket.video,
                              hour: _editedpaket.hour,
                              crew: _editedpaket.crew,
                              cake: _editedpaket.cake,
                              singer: _editedpaket.singer,
                              ins: _editedpaket.ins,
                              mua: _editedpaket.mua,
                              catering: _editedpaket.catering,
                              stage: _editedpaket.stage,
                              gate: _editedpaket.gate,
                              table: _editedpaket.table,
                              groom: _editedpaket.groom,
                              bride: _editedpaket.bride,
                              live: _editedpaket.live,
                              venue: _editedpaket.venue,
                              detail: _editedpaket.detail,
                            );
                          },
                        ),
                        TextFormField(
                          initialValue: _initValues['venueType'],
                          decoration: const InputDecoration(
                            labelText: 'Tipe Venue',
                            hintText: 'Eg. Ballroon, Chappel, etc',
                          ),
                          focusNode: _tipeVenueFocus,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_lokasiFocus);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a tipe venue.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedpaket = Paket(
                              id: _editedpaket.id,
                              nama: _editedpaket.nama,
                              harga: _editedpaket.harga,
                              venueType: value!,
                              lokasi: _editedpaket.lokasi,
                              tamu: _editedpaket.tamu,
                              image: _editedpaket.image,
                              mc: _editedpaket.mc,
                              car: _editedpaket.car,
                              photo: _editedpaket.photo,
                              video: _editedpaket.video,
                              hour: _editedpaket.hour,
                              crew: _editedpaket.crew,
                              cake: _editedpaket.cake,
                              singer: _editedpaket.singer,
                              ins: _editedpaket.ins,
                              mua: _editedpaket.mua,
                              catering: _editedpaket.catering,
                              stage: _editedpaket.stage,
                              gate: _editedpaket.gate,
                              table: _editedpaket.table,
                              groom: _editedpaket.groom,
                              bride: _editedpaket.bride,
                              live: _editedpaket.live,
                              venue: _editedpaket.venue,
                              detail: _editedpaket.detail,
                            );
                          },
                        ),
                        TextFormField(
                          initialValue: _initValues['lokasi'],
                          decoration: const InputDecoration(
                              labelText: 'Lokasi', hintText: 'City Name'),
                          focusNode: _lokasiFocus,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_tamuFocus);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a lokasi.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedpaket = Paket(
                              id: _editedpaket.id,
                              nama: _editedpaket.nama,
                              harga: _editedpaket.harga,
                              venueType: _editedpaket.venueType,
                              lokasi: value!,
                              tamu: _editedpaket.tamu,
                              image: _editedpaket.image,
                              mc: _editedpaket.mc,
                              car: _editedpaket.car,
                              photo: _editedpaket.photo,
                              video: _editedpaket.video,
                              hour: _editedpaket.hour,
                              crew: _editedpaket.crew,
                              cake: _editedpaket.cake,
                              singer: _editedpaket.singer,
                              ins: _editedpaket.ins,
                              mua: _editedpaket.mua,
                              catering: _editedpaket.catering,
                              stage: _editedpaket.stage,
                              gate: _editedpaket.gate,
                              table: _editedpaket.table,
                              groom: _editedpaket.groom,
                              bride: _editedpaket.bride,
                              live: _editedpaket.live,
                              venue: _editedpaket.venue,
                              detail: _editedpaket.detail,
                            );
                          },
                        ),
                        TextFormField(
                          initialValue: _initValues['tamu'],
                          decoration: const InputDecoration(
                              labelText: 'Jumlah Tamu', hintText: 'Pax'),
                          focusNode: _tamuFocus,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_imageFocus);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a tamu.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedpaket = Paket(
                              id: _editedpaket.id,
                              nama: _editedpaket.nama,
                              harga: _editedpaket.harga,
                              venueType: _editedpaket.venueType,
                              lokasi: _editedpaket.lokasi,
                              tamu: int.parse(value!),
                              image: _editedpaket.image,
                              mc: _editedpaket.mc,
                              car: _editedpaket.car,
                              photo: _editedpaket.photo,
                              video: _editedpaket.video,
                              hour: _editedpaket.hour,
                              crew: _editedpaket.crew,
                              cake: _editedpaket.cake,
                              singer: _editedpaket.singer,
                              ins: _editedpaket.ins,
                              mua: _editedpaket.mua,
                              catering: _editedpaket.catering,
                              stage: _editedpaket.stage,
                              gate: _editedpaket.gate,
                              table: _editedpaket.table,
                              groom: _editedpaket.groom,
                              bride: _editedpaket.bride,
                              live: _editedpaket.live,
                              venue: _editedpaket.venue,
                              detail: _editedpaket.detail,
                            );
                          },
                          keyboardType: TextInputType.number,
                        ),
                        TextFormField(
                          initialValue: _initValues['image'],
                          decoration: const InputDecoration(
                            labelText: 'Image Url',
                          ),
                          focusNode: _imageFocus,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_crewFocus);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a imageurl.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedpaket = Paket(
                              id: _editedpaket.id,
                              nama: _editedpaket.nama,
                              harga: _editedpaket.harga,
                              venueType: _editedpaket.venueType,
                              lokasi: _editedpaket.lokasi,
                              tamu: _editedpaket.tamu,
                              image: value!,
                              mc: _editedpaket.mc,
                              car: _editedpaket.car,
                              photo: _editedpaket.photo,
                              video: _editedpaket.video,
                              hour: _editedpaket.hour,
                              crew: _editedpaket.crew,
                              cake: _editedpaket.cake,
                              singer: _editedpaket.singer,
                              ins: _editedpaket.ins,
                              mua: _editedpaket.mua,
                              catering: _editedpaket.catering,
                              stage: _editedpaket.stage,
                              gate: _editedpaket.gate,
                              table: _editedpaket.table,
                              groom: _editedpaket.groom,
                              bride: _editedpaket.bride,
                              live: _editedpaket.live,
                              venue: _editedpaket.venue,
                              detail: _editedpaket.detail,
                            );
                          },
                        ),
                        TextFormField(
                          initialValue: _initValues['crew'],
                          decoration: const InputDecoration(
                              labelText: 'Crew', hintText: 'Person'),
                          keyboardType: TextInputType.number,
                          focusNode: _crewFocus,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_cakeFocus);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a crew.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedpaket = Paket(
                              id: _editedpaket.id,
                              nama: _editedpaket.nama,
                              harga: _editedpaket.harga,
                              venueType: _editedpaket.venueType,
                              lokasi: _editedpaket.lokasi,
                              tamu: _editedpaket.tamu,
                              image: _editedpaket.image,
                              mc: _editedpaket.mc,
                              car: _editedpaket.car,
                              photo: _editedpaket.photo,
                              video: _editedpaket.video,
                              hour: _editedpaket.hour,
                              crew: int.parse(value!),
                              cake: _editedpaket.cake,
                              singer: _editedpaket.singer,
                              ins: _editedpaket.ins,
                              mua: _editedpaket.mua,
                              catering: _editedpaket.catering,
                              stage: _editedpaket.stage,
                              gate: _editedpaket.gate,
                              table: _editedpaket.table,
                              groom: _editedpaket.groom,
                              bride: _editedpaket.bride,
                              live: _editedpaket.live,
                              venue: _editedpaket.venue,
                              detail: _editedpaket.detail,
                            );
                          },
                        ),
                        TextFormField(
                          initialValue: _initValues['cake'],
                          decoration: const InputDecoration(
                              labelText: 'Wedding Cake', hintText: 'Tiers'),
                          keyboardType: TextInputType.number,
                          focusNode: _cakeFocus,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_carFocus);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a cake.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedpaket = Paket(
                              id: _editedpaket.id,
                              nama: _editedpaket.nama,
                              harga: _editedpaket.harga,
                              venueType: _editedpaket.venueType,
                              lokasi: _editedpaket.lokasi,
                              tamu: _editedpaket.tamu,
                              image: _editedpaket.image,
                              mc: _editedpaket.mc,
                              car: _editedpaket.car,
                              photo: _editedpaket.photo,
                              video: _editedpaket.video,
                              hour: _editedpaket.hour,
                              crew: _editedpaket.crew,
                              cake: int.parse(value!),
                              singer: _editedpaket.singer,
                              ins: _editedpaket.ins,
                              mua: _editedpaket.mua,
                              catering: _editedpaket.catering,
                              stage: _editedpaket.stage,
                              gate: _editedpaket.gate,
                              table: _editedpaket.table,
                              groom: _editedpaket.groom,
                              bride: _editedpaket.bride,
                              live: _editedpaket.live,
                              venue: _editedpaket.venue,
                              detail: _editedpaket.detail,
                            );
                          },
                        ),
                        TextFormField(
                          initialValue: _initValues['car'],
                          decoration: const InputDecoration(
                              labelText: 'Wedding Car',
                              hintText: 'E.g 1 if available'),
                          keyboardType: TextInputType.number,
                          focusNode: _carFocus,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_mcFoucs);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a car.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedpaket = Paket(
                              id: _editedpaket.id,
                              nama: _editedpaket.nama,
                              harga: _editedpaket.harga,
                              venueType: _editedpaket.venueType,
                              lokasi: _editedpaket.lokasi,
                              tamu: _editedpaket.tamu,
                              image: _editedpaket.image,
                              mc: _editedpaket.mc,
                              car: int.parse(value!),
                              photo: _editedpaket.photo,
                              video: _editedpaket.video,
                              hour: _editedpaket.hour,
                              crew: _editedpaket.crew,
                              cake: _editedpaket.cake,
                              singer: _editedpaket.singer,
                              ins: _editedpaket.ins,
                              mua: _editedpaket.mua,
                              catering: _editedpaket.catering,
                              stage: _editedpaket.stage,
                              gate: _editedpaket.gate,
                              table: _editedpaket.table,
                              groom: _editedpaket.groom,
                              bride: _editedpaket.bride,
                              live: _editedpaket.live,
                              venue: _editedpaket.venue,
                              detail: _editedpaket.detail,
                            );
                          },
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                initialValue: _initValues['mc'],
                                decoration: const InputDecoration(
                                    labelText: 'Master Of Ceremony',
                                    hintText: 'Person'),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                focusNode: _mcFoucs,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a mc.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editedpaket = Paket(
                                    id: _editedpaket.id,
                                    nama: _editedpaket.nama,
                                    harga: _editedpaket.harga,
                                    venueType: _editedpaket.venueType,
                                    lokasi: _editedpaket.lokasi,
                                    tamu: _editedpaket.tamu,
                                    image: _editedpaket.image,
                                    mc: int.parse(value!),
                                    car: _editedpaket.car,
                                    photo: _editedpaket.photo,
                                    video: _editedpaket.video,
                                    hour: _editedpaket.hour,
                                    crew: _editedpaket.crew,
                                    cake: _editedpaket.cake,
                                    singer: _editedpaket.singer,
                                    ins: _editedpaket.ins,
                                    mua: _editedpaket.mua,
                                    catering: _editedpaket.catering,
                                    stage: _editedpaket.stage,
                                    gate: _editedpaket.gate,
                                    table: _editedpaket.table,
                                    groom: _editedpaket.groom,
                                    bride: _editedpaket.bride,
                                    live: _editedpaket.live,
                                    venue: _editedpaket.venue,
                                    detail: _editedpaket.detail,
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                initialValue: _initValues['singer'],
                                decoration: const InputDecoration(
                                    labelText: 'Singer', hintText: 'Person'),
                                keyboardType: TextInputType.number,
                                focusNode: _singerFocus,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_insFocus);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a singer.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editedpaket = Paket(
                                    id: _editedpaket.id,
                                    nama: _editedpaket.nama,
                                    harga: _editedpaket.harga,
                                    venueType: _editedpaket.venueType,
                                    lokasi: _editedpaket.lokasi,
                                    tamu: _editedpaket.tamu,
                                    image: _editedpaket.image,
                                    mc: _editedpaket.mc,
                                    car: _editedpaket.car,
                                    photo: _editedpaket.photo,
                                    video: _editedpaket.video,
                                    hour: _editedpaket.hour,
                                    crew: _editedpaket.crew,
                                    cake: _editedpaket.cake,
                                    singer: int.parse(value!),
                                    ins: _editedpaket.ins,
                                    mua: _editedpaket.mua,
                                    catering: _editedpaket.catering,
                                    stage: _editedpaket.stage,
                                    gate: _editedpaket.gate,
                                    table: _editedpaket.table,
                                    groom: _editedpaket.groom,
                                    bride: _editedpaket.bride,
                                    live: _editedpaket.live,
                                    venue: _editedpaket.venue,
                                    detail: _editedpaket.detail,
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                initialValue: _initValues['ins'],
                                decoration: const InputDecoration(
                                    labelText: 'Instrument',
                                    hintText: 'Person'),
                                keyboardType: TextInputType.number,
                                focusNode: _insFocus,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_photographerFocus);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a instrument.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editedpaket = Paket(
                                    id: _editedpaket.id,
                                    nama: _editedpaket.nama,
                                    harga: _editedpaket.harga,
                                    venueType: _editedpaket.venueType,
                                    lokasi: _editedpaket.lokasi,
                                    tamu: _editedpaket.tamu,
                                    image: _editedpaket.image,
                                    mc: _editedpaket.mc,
                                    car: _editedpaket.car,
                                    photo: _editedpaket.photo,
                                    video: _editedpaket.video,
                                    hour: _editedpaket.hour,
                                    crew: _editedpaket.crew,
                                    cake: _editedpaket.cake,
                                    singer: _editedpaket.singer,
                                    ins: int.parse(value!),
                                    mua: _editedpaket.mua,
                                    catering: _editedpaket.catering,
                                    stage: _editedpaket.stage,
                                    gate: _editedpaket.gate,
                                    table: _editedpaket.table,
                                    groom: _editedpaket.groom,
                                    bride: _editedpaket.bride,
                                    live: _editedpaket.live,
                                    venue: _editedpaket.venue,
                                    detail: _editedpaket.detail,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                initialValue: _initValues['photo'],
                                decoration: const InputDecoration(
                                    labelText: 'Photographer',
                                    hintText: 'Person'),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                focusNode: _photographerFocus,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_videographerFocus);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a photo.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editedpaket = Paket(
                                    id: _editedpaket.id,
                                    nama: _editedpaket.nama,
                                    harga: _editedpaket.harga,
                                    venueType: _editedpaket.venueType,
                                    lokasi: _editedpaket.lokasi,
                                    tamu: _editedpaket.tamu,
                                    image: _editedpaket.image,
                                    mc: _editedpaket.mc,
                                    car: _editedpaket.car,
                                    photo: int.parse(value!),
                                    video: _editedpaket.video,
                                    hour: _editedpaket.hour,
                                    crew: _editedpaket.crew,
                                    cake: _editedpaket.cake,
                                    singer: _editedpaket.singer,
                                    ins: _editedpaket.ins,
                                    mua: _editedpaket.mua,
                                    catering: _editedpaket.catering,
                                    stage: _editedpaket.stage,
                                    gate: _editedpaket.gate,
                                    table: _editedpaket.table,
                                    groom: _editedpaket.groom,
                                    bride: _editedpaket.bride,
                                    live: _editedpaket.live,
                                    venue: _editedpaket.venue,
                                    detail: _editedpaket.detail,
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                initialValue: _initValues['video'],
                                decoration: const InputDecoration(
                                    labelText: 'Videographer',
                                    hintText: 'Person'),
                                keyboardType: TextInputType.number,
                                focusNode: _videographerFocus,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_hourFocus);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a videographer.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editedpaket = Paket(
                                    id: _editedpaket.id,
                                    nama: _editedpaket.nama,
                                    harga: _editedpaket.harga,
                                    venueType: _editedpaket.venueType,
                                    lokasi: _editedpaket.lokasi,
                                    tamu: _editedpaket.tamu,
                                    image: _editedpaket.image,
                                    mc: _editedpaket.mc,
                                    car: _editedpaket.car,
                                    photo: _editedpaket.photo,
                                    video: int.parse(value!),
                                    hour: _editedpaket.hour,
                                    crew: _editedpaket.crew,
                                    cake: _editedpaket.cake,
                                    singer: _editedpaket.singer,
                                    ins: _editedpaket.ins,
                                    mua: _editedpaket.mua,
                                    catering: _editedpaket.catering,
                                    stage: _editedpaket.stage,
                                    gate: _editedpaket.gate,
                                    table: _editedpaket.table,
                                    groom: _editedpaket.groom,
                                    bride: _editedpaket.bride,
                                    live: _editedpaket.live,
                                    venue: _editedpaket.venue,
                                    detail: _editedpaket.detail,
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                initialValue: _initValues['hour'],
                                decoration: const InputDecoration(
                                  labelText: 'Duration',
                                  hintText: 'Hours',
                                ),
                                keyboardType: TextInputType.number,
                                focusNode: _hourFocus,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_stageFocus);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a duration.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editedpaket = Paket(
                                    id: _editedpaket.id,
                                    nama: _editedpaket.nama,
                                    harga: _editedpaket.harga,
                                    venueType: _editedpaket.venueType,
                                    lokasi: _editedpaket.lokasi,
                                    tamu: _editedpaket.tamu,
                                    image: _editedpaket.image,
                                    mc: _editedpaket.mc,
                                    car: _editedpaket.car,
                                    photo: _editedpaket.photo,
                                    video: _editedpaket.video,
                                    hour: int.parse(value!),
                                    crew: _editedpaket.crew,
                                    cake: _editedpaket.cake,
                                    singer: _editedpaket.singer,
                                    ins: _editedpaket.ins,
                                    mua: _editedpaket.mua,
                                    catering: _editedpaket.catering,
                                    stage: _editedpaket.stage,
                                    gate: _editedpaket.gate,
                                    table: _editedpaket.table,
                                    groom: _editedpaket.groom,
                                    bride: _editedpaket.bride,
                                    live: _editedpaket.live,
                                    venue: _editedpaket.venue,
                                    detail: _editedpaket.detail,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                initialValue: _initValues['stage'],
                                decoration: const InputDecoration(
                                    labelText: 'Stage Decoration',
                                    hintText: 'E.g 1 if available'),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                focusNode: _stageFocus,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_gateFocus);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a stage.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editedpaket = Paket(
                                    id: _editedpaket.id,
                                    nama: _editedpaket.nama,
                                    harga: _editedpaket.harga,
                                    venueType: _editedpaket.venueType,
                                    lokasi: _editedpaket.lokasi,
                                    tamu: _editedpaket.tamu,
                                    image: _editedpaket.image,
                                    mc: _editedpaket.mc,
                                    car: _editedpaket.car,
                                    photo: _editedpaket.photo,
                                    video: _editedpaket.video,
                                    hour: _editedpaket.hour,
                                    crew: _editedpaket.crew,
                                    cake: _editedpaket.cake,
                                    singer: _editedpaket.singer,
                                    ins: _editedpaket.ins,
                                    mua: _editedpaket.mua,
                                    catering: _editedpaket.catering,
                                    stage: int.parse(value!),
                                    gate: _editedpaket.gate,
                                    table: _editedpaket.table,
                                    groom: _editedpaket.groom,
                                    bride: _editedpaket.bride,
                                    live: _editedpaket.live,
                                    venue: _editedpaket.venue,
                                    detail: _editedpaket.detail,
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                initialValue: _initValues['gate'],
                                decoration: const InputDecoration(
                                    labelText: 'Wedding Gate',
                                    hintText: 'E.g 1 if available'),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                focusNode: _gateFocus,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_tableFocus);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a gate.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editedpaket = Paket(
                                    id: _editedpaket.id,
                                    nama: _editedpaket.nama,
                                    harga: _editedpaket.harga,
                                    venueType: _editedpaket.venueType,
                                    lokasi: _editedpaket.lokasi,
                                    tamu: _editedpaket.tamu,
                                    image: _editedpaket.image,
                                    mc: _editedpaket.mc,
                                    car: _editedpaket.car,
                                    photo: _editedpaket.photo,
                                    video: _editedpaket.video,
                                    hour: _editedpaket.hour,
                                    crew: _editedpaket.crew,
                                    cake: _editedpaket.cake,
                                    singer: _editedpaket.singer,
                                    ins: _editedpaket.ins,
                                    mua: _editedpaket.mua,
                                    catering: _editedpaket.catering,
                                    stage: _editedpaket.stage,
                                    gate: int.parse(value!),
                                    table: _editedpaket.table,
                                    groom: _editedpaket.groom,
                                    bride: _editedpaket.bride,
                                    live: _editedpaket.live,
                                    venue: _editedpaket.venue,
                                    detail: _editedpaket.detail,
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                initialValue: _initValues['table'],
                                decoration: const InputDecoration(
                                    labelText: 'Table Decoration',
                                    hintText: 'E.g 1 if available'),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                focusNode: _tableFocus,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_muaFocus);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a table.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editedpaket = Paket(
                                    id: _editedpaket.id,
                                    nama: _editedpaket.nama,
                                    harga: _editedpaket.harga,
                                    venueType: _editedpaket.venueType,
                                    lokasi: _editedpaket.lokasi,
                                    tamu: _editedpaket.tamu,
                                    image: _editedpaket.image,
                                    mc: _editedpaket.mc,
                                    car: _editedpaket.car,
                                    photo: _editedpaket.photo,
                                    video: _editedpaket.video,
                                    hour: _editedpaket.hour,
                                    crew: _editedpaket.crew,
                                    cake: _editedpaket.cake,
                                    singer: _editedpaket.singer,
                                    ins: _editedpaket.ins,
                                    mua: _editedpaket.mua,
                                    catering: _editedpaket.catering,
                                    stage: _editedpaket.stage,
                                    gate: _editedpaket.gate,
                                    table: int.parse(value!),
                                    groom: _editedpaket.groom,
                                    bride: _editedpaket.bride,
                                    live: _editedpaket.live,
                                    venue: _editedpaket.venue,
                                    detail: _editedpaket.detail,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                initialValue: _initValues['mua'],
                                decoration: const InputDecoration(
                                    labelText: 'Make Up Artist',
                                    hintText: 'Person'),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                focusNode: _muaFocus,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_groomFocus);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a mua.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editedpaket = Paket(
                                    id: _editedpaket.id,
                                    nama: _editedpaket.nama,
                                    harga: _editedpaket.harga,
                                    venueType: _editedpaket.venueType,
                                    lokasi: _editedpaket.lokasi,
                                    tamu: _editedpaket.tamu,
                                    image: _editedpaket.image,
                                    mc: _editedpaket.mc,
                                    car: _editedpaket.car,
                                    photo: _editedpaket.photo,
                                    video: _editedpaket.video,
                                    hour: _editedpaket.hour,
                                    crew: _editedpaket.crew,
                                    cake: _editedpaket.cake,
                                    singer: _editedpaket.singer,
                                    ins: _editedpaket.ins,
                                    mua: int.parse(value!),
                                    catering: _editedpaket.catering,
                                    stage: _editedpaket.stage,
                                    gate: _editedpaket.gate,
                                    table: _editedpaket.table,
                                    groom: _editedpaket.groom,
                                    bride: _editedpaket.bride,
                                    live: _editedpaket.live,
                                    venue: _editedpaket.venue,
                                    detail: _editedpaket.detail,
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                initialValue: _initValues['groom'],
                                decoration: const InputDecoration(
                                  labelText: 'Groom Suit',
                                  hintText: 'E.g 1 if available',
                                ),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                focusNode: _groomFocus,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_brideFocus);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a groom.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editedpaket = Paket(
                                    id: _editedpaket.id,
                                    nama: _editedpaket.nama,
                                    harga: _editedpaket.harga,
                                    venueType: _editedpaket.venueType,
                                    lokasi: _editedpaket.lokasi,
                                    tamu: _editedpaket.tamu,
                                    image: _editedpaket.image,
                                    mc: _editedpaket.mc,
                                    car: _editedpaket.car,
                                    photo: _editedpaket.photo,
                                    video: _editedpaket.video,
                                    hour: _editedpaket.hour,
                                    crew: _editedpaket.crew,
                                    cake: _editedpaket.cake,
                                    singer: _editedpaket.singer,
                                    ins: _editedpaket.ins,
                                    mua: _editedpaket.mua,
                                    catering: _editedpaket.catering,
                                    stage: _editedpaket.stage,
                                    gate: _editedpaket.gate,
                                    table: _editedpaket.table,
                                    groom: int.parse(value!),
                                    bride: _editedpaket.bride,
                                    live: _editedpaket.live,
                                    venue: _editedpaket.venue,
                                    detail: _editedpaket.detail,
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                initialValue: _initValues['bride'],
                                decoration: const InputDecoration(
                                    labelText: 'Bride Suit',
                                    hintText: 'E.g 1 if available'),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                focusNode: _brideFocus,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_liveFocus);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a bride.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editedpaket = Paket(
                                    id: _editedpaket.id,
                                    nama: _editedpaket.nama,
                                    harga: _editedpaket.harga,
                                    venueType: _editedpaket.venueType,
                                    lokasi: _editedpaket.lokasi,
                                    tamu: _editedpaket.tamu,
                                    image: _editedpaket.image,
                                    mc: _editedpaket.mc,
                                    car: _editedpaket.car,
                                    photo: _editedpaket.photo,
                                    video: _editedpaket.video,
                                    hour: _editedpaket.hour,
                                    crew: _editedpaket.crew,
                                    cake: _editedpaket.cake,
                                    singer: _editedpaket.singer,
                                    ins: _editedpaket.ins,
                                    mua: _editedpaket.mua,
                                    catering: _editedpaket.catering,
                                    stage: _editedpaket.stage,
                                    gate: _editedpaket.gate,
                                    table: _editedpaket.table,
                                    groom: _editedpaket.groom,
                                    bride: int.parse(value!),
                                    live: _editedpaket.live,
                                    venue: _editedpaket.venue,
                                    detail: _editedpaket.detail,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          initialValue: _initValues['live'],
                          decoration: const InputDecoration(
                              labelText: 'Live Stream',
                              hintText: 'Eg. 1 if available'),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          focusNode: _liveFocus,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_venueFocus);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a live.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedpaket = Paket(
                              id: _editedpaket.id,
                              nama: _editedpaket.nama,
                              harga: _editedpaket.harga,
                              venueType: _editedpaket.venueType,
                              lokasi: _editedpaket.lokasi,
                              tamu: _editedpaket.tamu,
                              image: _editedpaket.image,
                              mc: _editedpaket.mc,
                              car: _editedpaket.car,
                              photo: _editedpaket.photo,
                              video: _editedpaket.video,
                              hour: _editedpaket.hour,
                              crew: _editedpaket.crew,
                              cake: _editedpaket.cake,
                              singer: _editedpaket.singer,
                              ins: _editedpaket.ins,
                              mua: _editedpaket.mua,
                              catering: _editedpaket.catering,
                              stage: _editedpaket.stage,
                              gate: _editedpaket.gate,
                              table: _editedpaket.table,
                              groom: _editedpaket.groom,
                              bride: _editedpaket.bride,
                              live: int.parse(value!),
                              venue: _editedpaket.venue,
                              detail: _editedpaket.detail,
                            );
                          },
                        ),
                        TextFormField(
                          initialValue: _initValues['venue'],
                          decoration: const InputDecoration(
                            labelText: 'Venue Duration',
                            hintText: 'Hours',
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          focusNode: _venueFocus,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_detailFocus);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a venue.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedpaket = Paket(
                              id: _editedpaket.id,
                              nama: _editedpaket.nama,
                              harga: _editedpaket.harga,
                              venueType: _editedpaket.venueType,
                              lokasi: _editedpaket.lokasi,
                              tamu: _editedpaket.tamu,
                              image: _editedpaket.image,
                              mc: _editedpaket.mc,
                              car: _editedpaket.car,
                              photo: _editedpaket.photo,
                              video: _editedpaket.video,
                              hour: _editedpaket.hour,
                              crew: _editedpaket.crew,
                              cake: _editedpaket.cake,
                              singer: _editedpaket.singer,
                              ins: _editedpaket.ins,
                              mua: _editedpaket.mua,
                              catering: _editedpaket.catering,
                              stage: _editedpaket.stage,
                              gate: _editedpaket.gate,
                              table: _editedpaket.table,
                              groom: _editedpaket.groom,
                              bride: _editedpaket.bride,
                              live: _editedpaket.live,
                              venue: int.parse(value!),
                              detail: _editedpaket.detail,
                            );
                          },
                        ),
                        TextFormField(
                          initialValue: _initValues['detail'],
                          decoration: const InputDecoration(
                            labelText: 'Description',
                          ),
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.next,
                          focusNode: _detailFocus,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a detail.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedpaket = Paket(
                              id: _editedpaket.id,
                              nama: _editedpaket.nama,
                              harga: _editedpaket.harga,
                              venueType: _editedpaket.venueType,
                              lokasi: _editedpaket.lokasi,
                              tamu: _editedpaket.tamu,
                              image: _editedpaket.image,
                              mc: _editedpaket.mc,
                              car: _editedpaket.car,
                              photo: _editedpaket.photo,
                              video: _editedpaket.video,
                              hour: _editedpaket.hour,
                              crew: _editedpaket.crew,
                              cake: _editedpaket.cake,
                              singer: _editedpaket.singer,
                              ins: _editedpaket.ins,
                              mua: _editedpaket.mua,
                              catering: _editedpaket.catering,
                              stage: _editedpaket.stage,
                              gate: _editedpaket.gate,
                              table: _editedpaket.table,
                              groom: _editedpaket.groom,
                              bride: _editedpaket.bride,
                              live: _editedpaket.live,
                              venue: _editedpaket.venue,
                              detail: value!,
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: _saveForm,
                                    child: const Text('Save'))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
