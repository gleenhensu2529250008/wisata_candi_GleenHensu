import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';

class DetailScreen extends StatelessWidget {

  final Candi candi;
  const DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
  return Scaffold(body: SingleChildScrollView(
    child: Column(
        children: [
          //detail hader
          Stack(
            children: [
              //image utama
              Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
              child:ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  candi.imageAsset,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              ),
              //tombol back
    
              Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withAlpha(255),
                  shape: BoxShape.circle
                  ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              )
              )
              ),
            ],
          ),
    
          //detail info 
          Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(height: 16.0),
    
                  // info atas: nama candi dan tombol favorite
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        candi.name,
                        style:  TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon:  Icon(Icons.favorite_sharp, color: Colors.red),
                        onPressed: () {
                          // Handle favorite button press
                        },
                      ),
                    ],
                  ),
                   SizedBox(height: 16.0),
    
                  // info tengah: lokasi candi, tahun dibangun, jenis candi
                  Row(
                    children: [
                       Icon(Icons.place, color: Colors.red),
                       SizedBox(width: 8.0),
                       SizedBox(
                        width: 70,
                        child: Text(
                          'Lokasi ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(candi.built),
                    ],
                  ),
                  Row(
                    children: [
                       Icon(Icons.calendar_month, color: Colors.blue),
                       SizedBox(width: 8.0),
                       SizedBox(
                        width: 70,
                        child: Text(
                          'Lokasi ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(candi.location),
                    ],
                  ),
                  Row(
                    children: [
                       Icon(Icons.house, color: Colors.red),
                       SizedBox(width: 8.0),
                       SizedBox(
                        width: 70,
                        child: Text(
                          'Lokasi ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(candi.type),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Divider(color: Colors.deepPurple.shade100),
                  SizedBox(height: 16.0),
    
                  // deskripsi
                  Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(candi.description, textAlign: TextAlign.justify),
                ],
              ),
            ),
    
            // detail gallery
            Padding(padding: EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [Divider(color: Colors.deepPurple.shade100,),
            Text('Gallery', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            SizedBox(height: 16.0),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: candi.imageUrls.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.deepPurple.shade100,
                            width: 2,
                          )
                        ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: candi.imageUrls[index],
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[50],
                              border: Border.all(
                                color: Colors.deepPurple.shade100,
                                width: 2,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  );
                },
              ),
            ),
            SizedBox(height: 4),
            Text('Klik Gambar untuk memperbesar',)
            ]))
          ],
        ),
  ),
    );
  }
}