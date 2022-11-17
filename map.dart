import 'dart:io';

void main() {
  // Kontrol İslemi
  final RegExp numberExp =
      new RegExp("[a-zA-Z ]*\\d+.*", caseSensitive: false, multiLine: false);
  //

  List<Map<String, dynamic>> Yumurtalar = [];

  Map<String, dynamic> Yumurta1 = {
    "id": 1,
    "Satıcısı": "Eymen",
    "Yumurta Boyutu": "S",
    "Yumurta Gramı": 3
  };
  Map<String, dynamic> Yumurta2 = {
    "id": 2,
    "Satıcısı": "Melih",
    "Yumurta Boyutu": "S",
    "Yumurta Gramı": 3
  };

  Yumurtalar.add(Yumurta1);
  Yumurtalar.add(Yumurta2);
  int tercih;

  while (true) {
    print("1.Listele");
    print("2.Gram Arama");
    print("3.Satıcı Ekle");
    print("4.Satıcı Güncelle");
    print("5.Satıcı Sil");
    print("------------------------------------");
    print("Tercihinizi Giriniz");
    String tercih = stdin.readLineSync()!;
    if (tercih == "1" ||
        tercih == "2" ||
        tercih == "3" ||
        tercih == "4" ||
        tercih == "5") {
      // Listeleme
      if (tercih == "1") {
        Yumurtalar.forEach((satici) {
          print(
              "------------------------------------------------------------------------");
          print("$satici  >>>>>>>>>");
          print(
              "------------------------------------------------------------------------");
        });
      }
      // Listeleme Bitiş
      // Gram Arama
      else if (tercih == "2") {
        print("Yumurta Gramını giriniz:");
        String yumurtagram = stdin.readLineSync()!;
        if (numberExp.hasMatch(yumurtagram)) {
          for (var yumurta in Yumurtalar) {
            var gram = yumurta["Yumurta Gramı"];
            if (gram == int.parse(yumurtagram)) {
              print(
                  "------------------------------------------------------------------------");
              print("$yumurta >>>>>>>>>");
              print(
                  "------------------------------------------------------------------------");
            }
          }
        } else if (yumurtagram == "q" || yumurtagram == "Q") {
          break;
        }
      }
      // Gram Arama Bitiş
      // Satıcı Ekleme
      else if (tercih == "3") {
        var satici;
        var boyut;
        var gram;
        print("Satıcı İsmini Giriniz:");
        satici = stdin.readLineSync()!.inCaps;
        print("Boyut Giriniz Örneğin XL,L:");
        boyut = stdin.readLineSync()!.toUpperCase();
        print("Gram Giriniz:");
        gram = stdin.readLineSync()!;

        // Kontrol
        if (gram == "Q" || satici == "Q" || boyut == "q") {
          print(
              "------------------------------------------------------------------------");
          print("Geri Dönüldü >>>>>>>>>");
          print(
              "------------------------------------------------------------------------");
          break;
        } else if (numberExp.hasMatch(boyut) ||
            numberExp.hasMatch(satici) ||
            !numberExp.hasMatch(gram)) {
          print("Yanlış Giriş Yapıldı");
          print("!!!!!!!!!!!!!!");
          continue;
        }
        // Kontrol Bitiş
        // Ekliyor
        else {
          int.parse(gram);
          // İd artıyor fakat güvenli artmıyo
          int id = Yumurtalar.length + 1;
          for (var yumurta in Yumurtalar) {
            // var index = Yumurtalar.elementAt(Yumurtalar.lastIndexWhere());
            // print(index);
            Map<String, dynamic> ekle = {
              "id": id,
              "Satıcısı": satici,
              "Yumurta Boyutu": boyut,
              "Yumurta Gramı": gram,
            };
            Yumurtalar.add(ekle);
            print("Satıcı Eklendi Görüntülemek İçin 1 e Basınız");
            break;
          }
        }
      }
      // Satıcı Ekleme Bitiş
      // Satıcı Güncelleme
      else if (tercih == "4") {
        print("Güncellemek İstediğiniz Satıcının İdsini Giriniz:");
        dynamic id = stdin.readLineSync()!;
        if (id == "q") {
          break;
        } else if (numberExp.hasMatch(id)) {
          // Güncelleme Doğrulamaları
          var idsi = int.parse(id);
          // Mapdaki İd yi çekmesi için for
          for (var yumurta in Yumurtalar) {
            var cekilenid = yumurta["id"];
            if (cekilenid == idsi) {
              print(yumurta);
              print("Neyi Değiştirmek İstiyorsunuz");
              print("1.Satıcı İsmi");
              print("2.Boyutu");
              print("3.Gramı");
              var sec = stdin.readLineSync()!;

              if (sec == "1")
              // Seçilme İşlemi Ve Güncelleme
              {
                print("Satici İsmi Giriniz:");
                var satici = stdin.readLineSync()!.inCaps;
                if (!numberExp.hasMatch(satici)) {
                  yumurta.update('Satıcısı', (value) => satici);
                } else {
                  print("Sayı Giremezsiniz Anasayfaya Dönüldü");
                }
              } else if (sec == "2") {
                print("Boyut Giriniz Örneğin XL,L:");
                var boyut = stdin.readLineSync()!.toUpperCase();
                if (!numberExp.hasMatch(boyut)) {
                  yumurta.update('Yumurta Boyutu', (value) => boyut);
                } else {
                  print("Sayı Giremezsiniz Anasayfaya Dönüldü");
                }
              } else if (sec == "3") {
                print("Gram Giriniz:");
                var gram = stdin.readLineSync()!;
                if (numberExp.hasMatch(gram)) {
                  int.parse(gram);
                  yumurta.update('Yumurta Gramı', (value) => gram);
                } // Seçilme Ve Güncelleme Bitiş
                else {
                  print("Harf Giremezsiniz Anasayfaya Dönüldü");
                }
              } else {
                print("!!! Yanlış Seçim !!!");
                break;
              }
            }
          }
        }
      }
      // Satıcı Güncelleme Bitiş
      else if (tercih == "5")
      // Satıcı Silme İşlemi
      {
        print("Silmek İstediğiniz Satıcının İd sini yazınız:");
        dynamic girilenid = stdin.readLineSync()!;
        if (girilenid == "q") {
          break;
        } else if (numberExp.hasMatch(girilenid)) {
          //  Silme İşlemi
          var idsi = int.parse(girilenid);
          for (var yumurta in Yumurtalar) {
            var id = yumurta["id"];
            var index = Yumurtalar.indexOf(yumurta);
            if (id == idsi) {
              Yumurtalar.remove(Yumurtalar.elementAt(index));
              print("Silme İşlemi Başarılı");
              break;
            }
          }
        }
      } else {
        print("Harf Giremezsiniz!");
      }
      // Satici Silme İşlemi Bitiş

    }
    ///////////////////////////////////////////////////////////
    else if (tercih == "q" || tercih == "Q") {
      break;
    } else if (numberExp.hasMatch(tercih) || !numberExp.hasMatch(tercih)) {
      print("------------------------------------");
      print("Çıkmak İçin q ya basınız");
      print("------------------------------------");
      continue;
    } else {
      break;
    }
  }
}

// String Harf Büyütmesi için
extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
}
