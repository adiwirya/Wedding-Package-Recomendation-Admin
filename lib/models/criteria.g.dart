// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'criteria.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Criteria _$CriteriaFromJson(Map<String, dynamic> json) => Criteria(
      dekorasi: json['dekorasi'] as int,
      bridal: json['bridal'] as int,
      catering: json['catering'] as int,
      dokumentasi: json['dokumentasi'] as int,
      venue: json['venue'] as int,
      entertaiment: json['entertaiment'] as int,
      tamu: json['jumlahTamu'] as int,
      harga: json['totalHarga'] as int,
      car: json['car'] as int,
      cake: json['cake'] as int,
      crew: json['crew'] as int,
      live: json['live'] as int,
    );

Map<String, dynamic> _$CriteriaToJson(Criteria instance) => <String, dynamic>{
      'dekorasi': instance.dekorasi,
      'bridal': instance.bridal,
      'catering': instance.catering,
      'dokumentasi': instance.dokumentasi,
      'venue': instance.venue,
      'entertaiment': instance.entertaiment,
      'jumlahTamu': instance.tamu,
      'totalHarga': instance.harga,
      'car': instance.car,
      'cake': instance.cake,
      'crew': instance.crew,
      'live': instance.live,
    };
