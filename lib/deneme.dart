import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:konum_denemee/karakter.dart';
import 'package:konum_denemee/sonuc_ekrani.dart';
import 'package:konum_denemee/oyun_sonu.dart';
import 'question.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Map<String, LatLng> cities = {
    'Ankara': LatLng(39.9334, 32.8597),
    'İstanbul': LatLng(41.0082, 28.9784),
    'Zonguldak': LatLng(41.459081, 31.7589611),
    'Adana': LatLng(36.99033962049971, 35.331896418451194),
    'Adıyaman': LatLng(37.7674015, 38.275914),
    'Ağrı': LatLng(39.7220317,42.9938573),
    'Amasya': LatLng(40.6562858, 35.7808037),
    'Antalya': LatLng(36.779012,30.4976671),
    'Artvin': LatLng(41.1796895,41.7974376),
    'Aydın': LatLng(37.8513313,27.7672479),
    'Balıkesir': LatLng(39.65049173917415, 27.888598390642965),
    'Bilecik': LatLng(40.1639183,29.9333897),
    'Bingöl': LatLng(38.9226042,39.8544369),
    'Bitlis': LatLng(38.4046052,42.0305192),
    'Bolu': LatLng(40.7358439,31.5327419),
    'Burdur': LatLng(37.7326837,30.2001908),
    'Bursa': LatLng(40.2218543,28.7033394),
    'Çanakkale': LatLng(40.1448011,26.4065844),
    'Çankırı': LatLng(40.598758,33.6116744),
    'Çorum': LatLng(40.554864,34.9513714,),
    'Denizli': LatLng(37.78327069965813, 29.096463633651208),
    'Diyarbakır': LatLng(37.92640471242001, 40.209971859335745),
    'Edirne': LatLng(41.67736920628837, 26.555740279965338),
    'Elazığ': LatLng(38.67538525192915, 39.22245354010956),
    'Erzincan': LatLng(39.74640898949775, 39.49117115468848),
    'Erzurum': LatLng(39.906429121334, 41.265398325568626),
    'Eskişehir': LatLng(39.766489889364415, 30.52563753182775),
    'Gaziantep': LatLng(37.0691134015012, 37.37696121322082),
    'Giresun': LatLng(40.91616177954493, 38.39182482381396),
    'Gümüşhane': LatLng(40.46045004928824, 39.479869871291115),
    'Konya': LatLng(37.87388778022728, 32.49322518040371),
    'Hakkari': LatLng(37.5768747742105, 43.736495152160835),
    'Hatay': LatLng(36.56726774448724, 36.17705899395088),
    'Isparta': LatLng(37.76293783758735, 30.55380077430223),
    'Mersin': LatLng(36.813137472296965, 34.641329720872974),
    'İzmir': LatLng(38.42436571758348, 27.142915433651883),
    'Kars': LatLng(40.60141296618789, 43.09746646590973),
    'Kastamonu': LatLng(41.376922396163486, 33.77647572568236),
    'Kayseri': LatLng(38.71982224006142, 35.48249303329423),
    'Kırklareli': LatLng(41.71364762202855, 27.226545997074034),
    'Kırşehir': LatLng(39.14623097024338, 34.15943924581133),
    'Kocaeli': LatLng(40.765885300114945, 29.94080612998187),
    'Kütahya': LatLng(39.41965608584819, 29.985670637835742),
    'Malatya': LatLng(38.35461618645431, 38.33311165695666),
    'Manisa': LatLng(38.613791829255256, 27.429628597624042),
    'Kahramanmaraş': LatLng(37.574765319789854, 36.92285986923459),
    'Mardin': LatLng(37.30530901051694, 40.73084180602228),
    'Muğla': LatLng(37.21527001627212, 28.36346454852221),
    'Muş': LatLng(38.73372580980854, 41.49108530979638),
    'Nevşehir': LatLng(38.624454002028216, 34.71403845853354),
    'Niğde': LatLng(37.969730225237775, 34.676594426346995),
    'Ordu': LatLng(40.984840978717365, 37.879615579847304),
    'Rize': LatLng(41.02527589287728, 40.51754586811521),
    'Sakarya': LatLng(40.77411414210369, 30.394448913793696),
    'Samsun': LatLng(41.27992605600381, 36.33592493684615),
    'Siirt': LatLng(37.927331707461505, 41.9420057043332),
    'Sinop': LatLng(42.027806645668406, 35.15162963768931),
    'Sivas': LatLng(39.75004004894464, 37.014991793192884),
    'Tekirdağ': LatLng(40.977629793628424, 27.51118061378109),
    'Tokat': LatLng(40.32333095659568, 36.55212513595563),
    'Trabzon': LatLng(41.00130035928065, 39.715566458440726),
    'Tunceli': LatLng(39.10609944082562, 39.54825796184612),
    'Şanlıurfa': LatLng(37.16640612208983, 38.795782804574905),
    'Uşak': LatLng(38.67416273902041, 29.405812562806755),
    'Van': LatLng(38.501005766013265, 43.372842799685884),
    'Yozgat': LatLng(39.820904318070994, 34.808554909485295),
    'Aksaray': LatLng(38.36847045154315, 34.029690363153904),
    'Bayburt': LatLng(40.26020296315836, 40.227974831584326),
    'Karaman': LatLng(37.18090076437693, 33.22218748791634),
    'Kırıkkale': LatLng(39.84005273971567, 33.50878102508268),
    'Şırnak': LatLng(37.51887546140234, 42.453618323708376),
    'Bartın': LatLng(41.63743152216881, 32.33380641945836),
    'Ardahan': LatLng(41.11260067053369, 42.702017040424884),
    'Iğdır': LatLng(39.91939492488668, 44.043642830376356),
    'Yalova': LatLng(40.655285892985376, 29.284245445609333),
    'Karabük': LatLng(41.196206787328926, 32.622832613654005),
    'Kilis': LatLng(36.71614207663856, 37.11455067741419),
    'Osmaniye': LatLng(37.074155509355556, 36.24599287428556),
    'Düzce': LatLng(40.83825372336452, 31.162336442750544),
    'Afyonkarahisar': LatLng(38.757315161534294, 30.538100167343632),
    'Batman': LatLng(37.889865437023715, 41.12915975700493),
  };

  late GoogleMapController mapController;
  Question? currentQuestion;
  List<Question> questions = [];
  bool isLoading = true;
  bool isCharacterVisible = true;
  Set<String> selectedCities = {};
  int lives = 3; // Kullanıcının can sayısı
  int score = 0; // Kullanıcının puanı

  @override
  void initState() {
    super.initState();
    loadQuestions().then((loadedQuestions) {
      setState(() {
        questions = loadedQuestions;
        setNewQuestion();
        isLoading = false;
      });
    }).catchError((error) {
      print('Sorular yüklenirken hata oluştu: $error');
    });
  }

  void setNewQuestion() {
    if (questions.isNotEmpty) {
      setState(() {
        currentQuestion = questions[Random().nextInt(questions.length)];
        selectedCities = _selectCities(currentQuestion!.answer);
      });
    } else {
      setState(() {
        currentQuestion = null;
      });
    }
  }

  Set<String> _selectCities(String correctCity) {
    final random = Random();
    final citiesList = cities.keys.toList();
    citiesList.remove(correctCity);
    citiesList.shuffle(random);

    // 3 rastgele şehir seçimi
    Set<String> selected = {correctCity};
    selected.addAll(citiesList.take(3));

    // Eğer seçilen şehirler 4'ten azsa, rastgele şehirler eklemeye devam et
    while (selected.length < 4) {
      selected.add(citiesList[random.nextInt(citiesList.length)]);
    }

    return selected;
  }

  void _showResultDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (lives == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OyunSonu(puan: score)),
                );
              } else {
                setNewQuestion();
              }
            },
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  Widget _buildHearts() {
    List<Widget> hearts = [];
    for (int i = 0; i < 3; i++) {
      hearts.add(
        Icon(
          i < lives ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: hearts,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isCharacterVisible = true;
          });
        },
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(39.27, 35.36),
                zoom: 5.9,
              ),
              markers: selectedCities.map((city) {
                final cityLatLng = cities[city];
                if (cityLatLng == null) {
                  return null;
                }
                return Marker(
                  markerId: MarkerId(city),
                  position: cityLatLng,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueViolet,
                  ),
                  onTap: () {
                    if (currentQuestion != null) {
                      setState(() {
                        if (city == currentQuestion?.answer) {
                          score += 10;
                          _showResultDialog('Tebrikler!', 'Doğru şehri seçtiniz: $city\nPuanınız: $score');
                        } else {
                          lives -= 1;
                          if (lives == 0) {
                            _showResultDialog('Oyun Bitti!', 'Canınız kalmadı. Doğru şehir: ${currentQuestion?.answer}');
                          } else {
                            _showResultDialog('Üzgünüz!', 'Yanlış şehri seçtiniz. Doğru şehir: ${currentQuestion?.answer}');
                          }
                        }
                      });
                    }
                  },
                );
              }).whereType<Marker>().toSet(),
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                });
              },
            ),
            Positioned(
              top: 20.0,
              left: 100,
              child: Container(
                width: 540.0,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  currentQuestion?.question ?? '',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              right: 60.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OyunSonu(puan: score),
                    ),
                  );
                },
                child: const Text('Oyunu bitir'),
              ),
            ),
            Positioned(
              right: 10.0,
              top: MediaQuery.of(context).size.height / 2 - 50,
              child: _buildHearts(),
            ),
            Positioned(
              right: 10.0,
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Text(
                  'Puan: $score',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SolImage(),
          ],
        ),
      ),
    );
  }
}
