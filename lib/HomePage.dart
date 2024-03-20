import 'package:flutter/material.dart';
import 'package:kuis_123210060/data_buku.dart';
import 'package:kuis_123210060/DetailPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Buku'),
      ),
      body: ListView.builder(
        itemCount: listBuku.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              listBuku[index].imageLink,
              width: 50,
              height: 50,
              fit: BoxFit.cover
            ),
            title: Text(listBuku[index].title),
            subtitle: Text('Penulis: ' + listBuku[index].author + '\n' + 
                      listBuku[index].pages.toString() + ' Halaman'
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(book: listBuku[index]),
                ),
              );
            }, 
          );
        },
      ),
    );
  }
}