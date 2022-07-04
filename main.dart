import 'package:flutter/material.dart';

class Wisata {
  final String gambar;
  final String judul;
  final String tanggal;
  final String deskripsi;
  final String star;

  Wisata(this.gambar, this.judul, this.tanggal, this.deskripsi, this.star);
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  final List<Wisata> wisata = [
    Wisata(
        'https://4.bp.blogspot.com/-yAptckjLyps/XDX6S1t4r3I/AAAAAAAABVo/p-iRhH2MzhcOv-zR-VwOzQjMiBGF-6K8ACLcBGAs/s1600/wisata%2Bcandi%2Bperambanan.jpg',
        'Candi Prambanan',
        'Minggu, 3 April 2022',
        'Candi Prambanan atau Candi Roro Jonggrang adalah kompleks candi Hindu terbesar di Indonesia yang dibangun pada abad ke-9 masehi. Candi ini dipersembahkan untuk Trimurti, tiga dewa utama Hindu yaitu dewa Brahma sebagai dewa pencipta, dewa Wisnu sebagai dewa pemelihara, dan dewa Siwa sebagai dewa pemusnah',
        '50'),
    Wisata(
        'https://assets.pikiran-rakyat.com/crop/4x8:1060x735/x/photo/2021/09/23/2332715756.jpg',
        'Tebing Breksi',
        'Minggu, 3 April 2022',
        'Tebing Breksi merupakan tempat wisata yang dibuka sejak tahun 2015. Tebing Breksi merupakan bongkahan batu yang dulunya menjadi lokasi pertambangan. Sekarang bekas lokasi pertambangan tersebut dikembangkan menjadi objek wisata yang bagus.',
        '30'),
    Wisata(
        'https://2.bp.blogspot.com/--pAf-bUYnGw/WLfpA9qaDxI/AAAAAAAAALk/e_uZ_Q9X8icugAwJ4RggMx6DG0O4pndxgCLcB/s640/Pantai-Indrayanti-Yogyakarta.png',
        'Pantai Indrayanti',
        'Minggu, 3 April 2022',
        'Selain candi dan gunung, Yogyakarta juga dikenal menyimpan segudang pantai eksotis, salah satunya Pantai Indrayanti. Pantai yang terletak di Kecamatan Gunungkidul, Yogyakarta ini berdekatan dengan sederet pantai indah lainnya, antara lain Pantai Sundak, Sadranan, Ngadong, dan Pantai Omandeng.',
        '50'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tempat Wisata Yogyakarta'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: wisata.length,
            itemBuilder: (context, index) {
              return new GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailWisata(
                                wisata: wisata[index],
                              )));
                },
                child: new Card(
                  child: new Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.network(
                          '${wisata[index].gambar}',
                          width: 150,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '${wisata[index].judul}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Text('${wisata[index].tanggal}'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class DetailWisata extends StatelessWidget {
  final Wisata wisata;

  DetailWisata({Key? key, required this.wisata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bagianjudul = Container(
      padding: const EdgeInsets.all(23),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(wisata.judul,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Text(wisata.tanggal,
                      style: TextStyle(color: Colors.grey[500])),
                ],
              ),
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(wisata.star)
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;
    Widget bagianbutton = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          kolombutton(color, Icons.call, 'Hubungi'),
          kolombutton(color, Icons.near_me, 'Lokasi'),
          kolombutton(color, Icons.share, 'Bagikan'),
        ],
      ),
    );

    Widget bagiandeskripsi = Container(
        padding: EdgeInsets.all(32),
        child: Text(
          wisata.deskripsi,
          softWrap: true,
          textAlign: TextAlign.justify,
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.judul),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(
            wisata.gambar,
            width: 600,
            fit: BoxFit.cover,
          ),
          bagianjudul,
          bagianbutton,
          bagiandeskripsi,
        ],
      ),
    );
  }

  Column kolombutton(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }
}
