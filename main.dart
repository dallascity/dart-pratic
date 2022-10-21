import 'dart:io';
import 'islem.dart';
// TERMİNAL ÜZERİNDEN ÇALIŞIYOR
void main() {
  print("Toplama (1)");
  print("Çıkarma (2)");
  print("Çarpma (3)");
  print("Bölme (4)");

  int tercih = int.parse(stdin.readLineSync()!);
  print("Tercihiniz : $tercih");

  print("Birinci Sayıyı Giriniz:");
  int a = int.parse(stdin.readLineSync()!);

  print("İkinci Sayıyı Giriniz:");
  int b = int.parse(stdin.readLineSync()!);

  islem con = new islem();
  if (tercih == 1) {
    print("Sonuç :");
    con.toplama(a, b);
  } else if (tercih == 2) {
    print("Sonuç :");
    con.cikarma(a, b);
  } else if (tercih == 3) {
    print("Sonuç :");
    con.carpma(a, b);
  } else if (tercih == 4) {
    print("Sonuç :");
    con.bolme(a, b);
  } else {
    print("Geçersiz");
  }

  // islem cek = new islem();

  // var top = cek.bolme(5, 10);
}
