import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import package ini

class ServisRekomendasiScreen extends StatelessWidget {
  const ServisRekomendasiScreen({super.key});

  // Fungsi untuk membuka Google Maps berdasarkan nama/alamat
  Future<void> _bukaGoogleMaps(String keyword) async {
    // Format URL pencarian Google Maps
    final Uri url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$keyword');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Tidak dapat membuka Google Maps');
    }
  }

  // Fungsi untuk menelepon atau buka WA
  Future<void> _hubungiKontak(String nomor) async {
    final Uri url = Uri.parse('tel:$nomor');
    if (!await launchUrl(url)) {
      throw Exception('Tidak dapat membuka aplikasi telepon');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Nanti list ini bisa diganti dengan hasil respon API (Database)
    final List<Map<String, String>> tempatServis = [
      {
        "nama": "Good Laptop Suhat",
        "alamat": "Jl. Soekarno Hatta, Jatimulyo",
        "kontak": "081234567890",
        "spesialisasi": "Spesialis Hardware & Reballing Chipset"
      },
      {
        "nama": "Dinoyo Computer Service",
        "alamat": "Jl. MT. Haryono, Dinoyo",
        "kontak": "085678901234",
        "spesialisasi": "Servis Ringan, Ganti RAM/SSD, Cleaning"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Rekomendasi Servis Terdekat")),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: tempatServis.length,
        itemBuilder: (context, index) {
          final bengkel = tempatServis[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 15),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.build_circle, color: Colors.indigo, size: 30),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                            bengkel["nama"]!,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Text("🛠 Spesialisasi: ${bengkel["spesialisasi"]!}"),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Tombol Buka Maps
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                        ),
                        icon: const Icon(Icons.location_on),
                        label: const Text("Maps"),
                        onPressed: () => _bukaGoogleMaps("${bengkel["nama"]} ${bengkel["alamat"]}"),
                      ),
                      // Tombol Hubungi
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        icon: const Icon(Icons.phone),
                        label: const Text("Hubungi"),
                        onPressed: () => _hubungiKontak(bengkel["kontak"]!),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}