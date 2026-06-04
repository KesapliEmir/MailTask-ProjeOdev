// Emirhan Kaplan 244602033 mobil programlama final odevi
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _ogrenciOnayKodu = "MOBIL2026";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MailTask-Projesi',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFF4F7F6), useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> mesajlar = [
    {'ad': 'Giresun Belediyesi İK', 'ozet': 'Staj belgeleriniz ve haftalık rapor dökümanlarınız onay birimine iletildi', 'renk': const Color(0xFF004D40), 'harf': 'G', 'gun': 'Pazartesi', 'saat': '12.30'},
    {'ad': 'Akademik Danışman', 'ozet': 'Final haftası ödev teslim tarihleri ve sınav kuralları sisteme girilmistir', 'renk': const Color(0xFF009688), 'harf': 'A', 'gun': 'Salı', 'saat': '09.15'},
    {'ad': 'Beşiktaş JK Mobil', 'ozet': 'Yeni sezon store ürünleri ve lisanslı ürün indirimleri panelinize tanımlandı', 'renk': Colors.black87, 'harf': 'B', 'gun': 'Çarşamba', 'saat': '14.00'},
    {'ad': 'Kartal Yuvası', 'ozet': 'Merakla beklenen yeni sezon efsane mac formaları öncelikli satıs dönemiyle basladı', 'renk': Colors.black54, 'harf': 'K', 'gun': 'Perşembe', 'saat': '16.45'},
    {'ad': 'BJK Passolig Destek', 'ozet': 'Gelecek hafta oynanacak derbi macının bilet yenileme ve transfer islemleri acıldı', 'renk': Colors.black26, 'harf': 'P', 'gun': 'Cuma', 'saat': '11.00'},
  ];
  final List<Map<String, dynamic>> gorevler = [
    {'is': 'Belediye bilgi islem merkezi haftalık staj raporu dökümü teslim edilecek', 'oncelik': 'Acil', 'renk': Colors.redAccent},
    {'is': 'Veritabanı optimizasyonu ders notları eksiksiz sekilde temize cekilecek', 'oncelik': 'Normal', 'renk': Colors.orangeAccent},
    {'is': 'Flutter projesinin widget test senaryoları terminalde calıstırılacak', 'oncelik': 'Acil', 'renk': Colors.redAccent},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 142, 110, 107),
        elevation: 2,
        automaticallyImplyLeading: false,
        leading: _currentIndex == 0 ? Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.apps_rounded, color: Colors.white, size: 24),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ) : null,
        title: Text(
          _currentIndex == 0 ? 'MailTask (E-posta ve Görev Yönetimi)' : 'Görevler', // 
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      //Sol taraftan acılan yan menu tasarımı yapıldı
      drawer: Drawer(
        child: Container(
          color: const Color(0xFFF4F7F6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 60, left: 20, bottom: 24, right: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 70, 162, 233),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white24,
                      child: Text('EK', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)), 
                    ),
                    const SizedBox(height: 14),
                    const Text('Emirhan Kaplan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 4),
                    Text('Öğrenci No: 244602033', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: AbsorbPointer(
                  child: Column(
                    children: const [
                      ListTile(leading: Icon(Icons.inbox_rounded, color: Color(0xFF004D40)), title: Text('Gelen Mesajlar', style: TextStyle(fontWeight: FontWeight.w500))),
                      ListTile(leading: Icon(Icons.outbox_rounded, color: Colors.black54), title: Text('Giden İletiler')),
                      ListTile(leading: Icon(Icons.delete_outline_rounded, color: Colors.black54), title: Text('Çöp Kutusu')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // Sayfalar arası geçiş için indexedstack kullanıldı
      body: IndexedStack(
        index: _currentIndex,
        children: [_buildMesajlarSekmesi(), _buildGorevlerSekmesi()],
      ),
      // Sağ alt köşede duran kalem butonu yer alıyor
      floatingActionButton: AbsorbPointer(
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF004D40),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: const Icon(Icons.add_task_rounded, color: Colors.white),
        ),
      ),
      // En alttaki sayfa değiştirme sekmeleri yönetiliyor
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.black12, width: 0.5))),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() { _currentIndex = index; }),
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF004D40),
          unselectedItemColor: Colors.black38,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline_rounded), activeIcon: Icon(Icons.chat_bubble_rounded), label: 'Mesajlar'),
            BottomNavigationBarItem(icon: Icon(Icons.check_box_outline_blank_rounded), activeIcon: Icon(Icons.check_box_rounded), label: 'Görevler'),
          ],
        ),
      ),
    );
  }
  // Gelen mesajların listelendiği arayüz tasarlandı
  Widget _buildMesajlarSekmesi() {
    return Column(
      children: [
        AbsorbPointer(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 46,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black12)),
              child: Row(
                children: const [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 14.0), child: Icon(Icons.search_rounded, color: Colors.black45)),
                  Text('Veriler arasında ara...', style: TextStyle(color: Colors.black38, fontSize: 14)),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            itemCount: mesajlar.length,
            itemBuilder: (context, index) {
              final mesaj = mesajlar[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFEBEBEB), width: 1),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 1, offset: Offset(0, 1))],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(mesaj['ad'], style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 14)),
                          const SizedBox(height: 4),
                          Text(mesaj['ozet'], maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.black54, fontSize: 12, height: 1.3)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(mesaj['gun'], style: const TextStyle(color: Color(0xFFF14635), fontSize: 11, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(mesaj['saat'], style: const TextStyle(color: Colors.black38, fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  //Görevlerin üst paneli  ve liste tasarlandı
  Widget _buildGorevlerSekmesi() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFFE0F2F1))),
                  child: Column(
                    children: [
                      Text('${gorevler.length}', style: const TextStyle(color: Color(0xFF004D40), fontWeight: FontWeight.bold, fontSize: 18)),
                      const Text('Toplam Görev', style: TextStyle(color: Colors.black54, fontSize: 11)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: const Color(0xFFE0F2F1), borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: const [
                      Text('%0', style: TextStyle(color: Color(0xFF004D40), fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('Tamamlanma Oranı', style: TextStyle(color: Color(0xFF004D40), fontSize: 11)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            itemCount: gorevler.length,
            itemBuilder: (context, index) {
              final gorev = gorevler[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE0E0E0), width: 0.8),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))],
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        gorev['is'],
                        style: const TextStyle(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w500, height: 1.3),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: gorev['renk'].withOpacity(0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        gorev['oncelik'],
                        style: TextStyle(color: gorev['renk'], fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
// Bu uygulama mobil programlama dersi kapsamında gelistirilmistir