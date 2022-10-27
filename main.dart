import 'dart:cli';
import 'dart:developer';
import 'dart:io';

import 'islem.dart';

// TERMİNAL ÜZERİNDEN ÇALIŞIYOR
// dart main.dart
void main() {
  final RegExp numberExp =
      new RegExp("[a-zA-Z ]*\\d+.*", caseSensitive: false, multiLine: false);

  // Başla
  for (var tercih = 0; tercih < 5;) {
    print("Toplama (1)");
    print("Çıkarma (2)");
    print("Çarpma (3)");
    print("Bölme (4)");
    print("Çıkış (q)");
    var tercih = stdin.readLineSync()!;

    print("Tercihiniz : $tercih");

    islem con = new islem();
    if (tercih == "4" || tercih == "3" || tercih == "2" || tercih == "1") {
      print("Birinci Sayıyı Giriniz:");
      // num a = num.parse(stdin.readLineSync()!);
      dynamic c = stdin.readLineSync()!;
      print("İkinci Sayıyı Giriniz:");
      dynamic d = stdin.readLineSync()!;
      // num b = num.parse(stdin.readLineSync()!);
      if (numberExp.hasMatch(c) && numberExp.hasMatch(d)) {
        var a = num.parse(c);
        var b = num.parse(d);

        if (tercih == "1") {
          print("Sonuç :");
          con.toplama(a, b);
          print("-------------------------------");
        } else if (tercih == "2") {
          print("Sonuç :");
          con.cikarma(a, b);
          print("-------------------------------");
        } else if (tercih == "3") {
          print("Sonuç :");
          con.carpma(a, b);
          print("-------------------------------");
        } else if (tercih == "4") {
          print("Sonuç :");
          con.bolme(a, b);
          print("-------------------------------");
        } else {}
        // break;
      } else if (c == "q" || d == "q") {
        print("Çıkış Yapıldı");
        exit(3);
      } else {
        print("Sayı Giriniz!");
      }
    } else if (tercih == "q") {
      print("Çıkış Yapıldı");
      exit(3);
    } else if (numberExp.hasMatch(tercih)) {
      print("Lütfen yukaridaki sayıları giriniz");
      continue;
    } else {
      print("Hatalı girdiniz");
    }
  }
}
  // islem cek = new islem();

  // var top = cek.bolme(5, 10);

