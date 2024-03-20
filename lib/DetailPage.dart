import 'package:flutter/material.dart';
import 'package:kuis_123210060/data_buku.dart';

class DetailPage extends StatelessWidget {
  final DataBuku book;

  DetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(book.imageLink),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Penulis: ' + book.author,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Bahasa: ' + book.language,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Negara: ' + book.country,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Jumlah Halaman: ' + book.pages.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Tahun Terbit: ' + book.year.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Status: ' + ((book.isAvailable) ? 'Tersedia' : 'Tidak Tersedia'),
                    style: TextStyle(fontSize: 16),
                  ),
                  ElevatedButton(  
                    onPressed: () {
                      _handlePinjam(context);
                    },
                    child: Text('Pinjam'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePinjam(BuildContext context) {
    if (book.isAvailable) {
      book.isAvailable = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Berhasil Meminjam Buku'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(book: book),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Buku Tidak Tersedia'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Future<void> _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}