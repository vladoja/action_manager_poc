import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class OsoEntity extends Equatable {
  final int id;
  final String meno;
  final String priezvisko;
  final String? titul;
  final String? telefon;
  final String? datumNarodenia;
  final String? miestoNarodenia;
  final String? bydlisko;
  final String? pek;
  final String? cisloPeciatky;
  final String? platnostOsvedceniaDatum;
  final int? zostavajuceDniPlatnosti;

  const OsoEntity(
      {required this.id,
      required this.meno,
      required this.priezvisko,
      required this.titul,
      required this.telefon,
      required this.datumNarodenia,
      required this.miestoNarodenia,
      required this.bydlisko,
      required this.pek,
      required this.cisloPeciatky,
      required this.platnostOsvedceniaDatum,
      this.zostavajuceDniPlatnosti = -1});

  @override
  List<Object?> get props {
    return [
      id,
      meno,
      priezvisko,
      titul,
      telefon,
      datumNarodenia,
      miestoNarodenia,
      bydlisko,
      pek,
      cisloPeciatky,
      platnostOsvedceniaDatum,
    ];
  }

  @override
  String toString() {
    return 'OsoEntity(id: $id, meno: $meno, priezvisko: $priezvisko, titul: $titul, telefon: $telefon, datumNarodenia: $datumNarodenia, miestoNarodenia: $miestoNarodenia, bydlisko: $bydlisko, pek: $pek, cisloPeciatky: $cisloPeciatky, platnostOsvedceniaDatum: $platnostOsvedceniaDatum, zostavajuceDniPlatnosti: $zostavajuceDniPlatnosti )';
  }

  OsoEntity copyWith({
    int? id,
    String? meno,
    String? priezvisko,
    ValueGetter<String?>? titul,
    ValueGetter<String?>? telefon,
    ValueGetter<String?>? datumNarodenia,
    ValueGetter<String?>? miestoNarodenia,
    ValueGetter<String?>? bydlisko,
    ValueGetter<String?>? pek,
    ValueGetter<String?>? cisloPeciatky,
    ValueGetter<String?>? platnostOsvedceniaDatum,
    ValueGetter<int?>? zostavajuceDniPlatnosti,
  }) {
    return OsoEntity(
      id: id ?? this.id,
      meno: meno ?? this.meno,
      priezvisko: priezvisko ?? this.priezvisko,
      titul: titul != null ? titul() : this.titul,
      telefon: telefon != null ? telefon() : this.telefon,
      datumNarodenia:
          datumNarodenia != null ? datumNarodenia() : this.datumNarodenia,
      miestoNarodenia:
          miestoNarodenia != null ? miestoNarodenia() : this.miestoNarodenia,
      bydlisko: bydlisko != null ? bydlisko() : this.bydlisko,
      pek: pek != null ? pek() : this.pek,
      cisloPeciatky:
          cisloPeciatky != null ? cisloPeciatky() : this.cisloPeciatky,
      platnostOsvedceniaDatum: platnostOsvedceniaDatum != null
          ? platnostOsvedceniaDatum()
          : this.platnostOsvedceniaDatum,
      zostavajuceDniPlatnosti: zostavajuceDniPlatnosti != null
          ? zostavajuceDniPlatnosti()
          : this.zostavajuceDniPlatnosti,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'meno': meno,
      'priezvisko': priezvisko,
      'titul': titul,
      'telefon': telefon,
      'datumNarodenia': datumNarodenia,
      'miestoNarodenia': miestoNarodenia,
      'bydlisko': bydlisko,
      'pek': pek,
      'cisloPeciatky': cisloPeciatky,
      'platnostOsvedceniaDatum': platnostOsvedceniaDatum,
      'zostavajuceDniPlatnosti': zostavajuceDniPlatnosti,
    };
  }

  factory OsoEntity.fromMap(Map<String, dynamic> map) {
    return OsoEntity(
      id: map['id']?.toInt() ?? 0,
      meno: map['meno'] ?? '',
      priezvisko: map['priezvisko'] ?? '',
      titul: map['titul'],
      telefon: map['telefon'],
      datumNarodenia: map['datumNarodenia'],
      miestoNarodenia: map['miestoNarodenia'],
      bydlisko: map['bydlisko'],
      pek: map['pek'],
      cisloPeciatky: map['cisloPeciatky'],
      platnostOsvedceniaDatum: map['platnostOsvedceniaDatum'],
      zostavajuceDniPlatnosti: map['zostavajuceDniPlatnosti']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory OsoEntity.fromJson(String source) =>
      OsoEntity.fromMap(json.decode(source));
}
