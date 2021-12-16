import 'package:json_annotation/json_annotation.dart';

part 'paket.g.dart';

@JsonSerializable()
class Paket {
  String? url;
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

  factory Paket.fromJson(Map<String, dynamic> json) => _$PaketFromJson(json);

  Map<String, dynamic> toJson() => _$PaketToJson(this);
}
