import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Paket with ChangeNotifier {
  String? url;
  String id;
  String nama;
  int harga;
  String venueType;
  String lokasi;
  int tamu;
  String image;
  int mc;
  int car;
  int photo;
  int video;
  int hour;
  int crew;
  int cake;
  int singer;
  int ins;
  int mua;
  int catering;
  int stage;
  int gate;
  int table;
  int groom;
  int bride;
  int live;
  int venue;
  String detail;

  Paket({
    this.url,
    required this.id,
    required this.nama,
    required this.harga,
    required this.venueType,
    required this.lokasi,
    required this.tamu,
    required this.image,
    required this.mc,
    required this.car,
    required this.photo,
    required this.video,
    required this.hour,
    required this.crew,
    required this.cake,
    required this.singer,
    required this.ins,
    required this.mua,
    required this.catering,
    required this.stage,
    required this.gate,
    required this.table,
    required this.groom,
    required this.bride,
    required this.live,
    required this.venue,
    required this.detail,
  });

  factory Paket.createPaket(Map<String, dynamic> obj) {
    return Paket(
      url: obj['url'],
      id: obj['id'],
      nama: obj['nama'],
      harga: obj['harga'],
      venueType: obj['venueType'],
      lokasi: obj['lokasi'],
      tamu: obj['tamu'],
      image: obj['image'],
      mc: obj['mc'],
      car: obj['car'],
      photo: obj['photo'],
      video: obj['video'],
      hour: obj['hour'],
      crew: obj['crew'],
      cake: obj['cake'],
      singer: obj['singer'],
      ins: obj['ins'],
      mua: obj['mua'],
      catering: obj['catering'],
      stage: obj['stage'],
      gate: obj['gate'],
      table: obj['table'],
      groom: obj['groom'],
      bride: obj['bride'],
      live: obj['live'],
      venue: obj['venue'],
      detail: obj['detail'],
    );
  }
}

class Pakets with ChangeNotifier {
  List<Paket> _pakets = [];

  List<Paket> get pakets {
    return [..._pakets];
  }

  Paket findById(String id) {
    return _pakets.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetPakets() async {
    final url = Uri.https('skripsi-spk-saw.herokuapp.com', '/api/paket');
    try {
      final response = await http.get(url);

      var jsonObj = json.decode(response.body);

      final List<Paket> loadedPakets = [];
      for (int i = 0; i < jsonObj.length; i++) {
        loadedPakets.add(Paket.createPaket(jsonObj[i]));
      }

      _pakets = loadedPakets;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<String> deleteItem(String id) async {
    final index = _pakets.indexWhere((paket) => paket.id == id);
    final url = Uri.https('skripsi-spk-saw.herokuapp.com', '/api/paket/$id');
    try {
      final response = await http.delete(url);
      final obj = json.decode(response.body);
      print(response.body);
      if (obj['message'] == "Data was Deleted") {
        _pakets.removeAt(index);
        notifyListeners();
      }

      return obj['message'];
    } catch (error) {
      return error.toString();
    }
  }

  Future<String> addItem(Paket paket) async {
    final url = Uri.https('skripsi-spk-saw.herokuapp.com', '/api/paket');
    print(paket.nama);
    try {
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode({
            'nama': paket.nama,
            'harga': paket.harga,
            'venueType': paket.venueType,
            'lokasi': paket.lokasi,
            'tamu': paket.tamu,
            'image': paket.image,
            'mc': paket.mc,
            'car': paket.car,
            'photo': paket.photo,
            'video': paket.video,
            'hour': paket.hour,
            'crew': paket.crew,
            'cake': paket.cake,
            'singer': paket.singer,
            'ins': paket.ins,
            'mua': paket.mua,
            'catering': paket.catering,
            'stage': paket.stage,
            'gate': paket.gate,
            'table': paket.table,
            'groom': paket.groom,
            'bride': paket.bride,
            'live': paket.live,
            'venue': paket.venue,
            'detail': paket.detail,
          }));
      final obj = json.decode(response.body);
      print(response.body);
      if (obj['message'] == "Data Created") {
        final newPaket = Paket(
          id: obj['paket']['id'],
          nama: obj['paket']['nama'],
          harga: obj['paket']['harga'],
          venueType: obj['paket']['venueType'],
          lokasi: obj['paket']['lokasi'],
          tamu: obj['paket']['tamu'],
          image: obj['paket']['image'],
          mc: obj['paket']['mc'],
          car: obj['paket']['car'],
          photo: obj['paket']['photo'],
          video: obj['paket']['video'],
          hour: obj['paket']['hour'],
          crew: obj['paket']['crew'],
          cake: obj['paket']['cake'],
          singer: obj['paket']['singer'],
          ins: obj['paket']['ins'],
          mua: obj['paket']['mua'],
          catering: obj['paket']['catering'],
          stage: obj['paket']['stage'],
          gate: obj['paket']['gate'],
          table: obj['paket']['table'],
          groom: obj['paket']['groom'],
          bride: obj['paket']['bride'],
          live: obj['paket']['live'],
          venue: obj['paket']['venue'],
          detail: obj['paket']['detail'],
        );
        _pakets.add(newPaket);
        notifyListeners();
      }
      return obj['message'];
    } catch (error) {
      return error.toString();
    }
  }

  Future<String> updateItem(String id, Paket paket) async {
    final index = _pakets.indexWhere((paket) => paket.id == id);
    final url = Uri.https('skripsi-spk-saw.herokuapp.com', '/api/paket/$id');
    try {
      final response = await http.put(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode({
            'nama': paket.nama,
            'harga': paket.harga,
            'venueType': paket.venueType,
            'lokasi': paket.lokasi,
            'tamu': paket.tamu,
            'image': paket.image,
            'mc': paket.mc,
            'car': paket.car,
            'photo': paket.photo,
            'video': paket.video,
            'hour': paket.hour,
            'crew': paket.crew,
            'cake': paket.cake,
            'singer': paket.singer,
            'ins': paket.ins,
            'mua': paket.mua,
            'catering': paket.catering,
            'stage': paket.stage,
            'gate': paket.gate,
            'table': paket.table,
            'groom': paket.groom,
            'bride': paket.bride,
            'live': paket.live,
            'venue': paket.venue,
            'detail': paket.detail,
          }));
      final obj = json.decode(response.body);
      print(response.body);
      if (obj['message'] == "Data Updated") {
        final newPaket = Paket(
          id: paket.id,
          nama: paket.nama,
          harga: paket.harga,
          venueType: paket.venueType,
          lokasi: paket.lokasi,
          tamu: paket.tamu,
          image: paket.image,
          mc: paket.mc,
          car: paket.car,
          photo: paket.photo,
          video: paket.video,
          hour: paket.hour,
          crew: paket.crew,
          cake: paket.cake,
          singer: paket.singer,
          ins: paket.ins,
          mua: paket.mua,
          catering: paket.catering,
          stage: paket.stage,
          gate: paket.gate,
          table: paket.table,
          groom: paket.groom,
          bride: paket.bride,
          live: paket.live,
          venue: paket.venue,
          detail: paket.detail,
        );
        _pakets[index] = paket;
        notifyListeners();
      }
      return obj['message'];
    } catch (error) {
      return error.toString();
    }
  }
}
