import 'package:json_annotation/json_annotation.dart';

part 'criteria.g.dart';

@JsonSerializable()
class Criteria {
  int dekorasi;
  int bridal;
  int catering;
  int dokumentasi;
  int venue;
  int entertaiment;
  @JsonKey(name: 'jumlahTamu')
  int tamu;
  @JsonKey(name: 'totalHarga')
  int harga;
  int car;
  int cake;
  int crew;
  int live;


  Criteria({
    required this.dekorasi,
    required this.bridal,
    required this.catering,
    required this.dokumentasi,
    required this.venue,
    required this.entertaiment,
    required this.tamu,
    required this.harga,
    required this.car,
    required this.cake,
    required this.crew,
    required this.live,
  });

  factory Criteria.fromJson(Map<String, dynamic> json) => _$CriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$CriteriaToJson(this);
}
