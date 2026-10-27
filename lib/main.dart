import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF075E54),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Data Profil Pembuat Tugas
  final String namaPembuat = "Syarifah Nadia Alysyia";
  final String nimPembuat = "5520124030";
  final String kelasPembuat = "Teknik Informatika";

  // Data Dummy Obrolan WhatsApp
  final List<Map<String, dynamic>> chatList = [
    {
      "name": "Rani Maharani",
      "message": "Nad, besok ada jadwal kuliah PBB jam berapa?",
      "time": "10.30",
      "unread": 2,
      "avatarColor": Colors.teal,
    },
    {
      "name": "Faza Fadillah",
      "message": "Tugas Flutter yang mod 4 udah kamu kerjain?",
      "time": "09.15",
      "unread": 1,
      "avatarColor": Colors.indigo,
    },
    {
      "name": "Dicky Kamilludin",
      "message": "Siap, nanti file kompoernya tak kirim.",
      "time": "Kemarin",
      "unread": 0,
      "avatarColor": Colors.orange,
    },
    {
      "name": "Bimo Heru",
      "message": "Jangan lupa kumpul sebelum jam 12 malam ya.",
      "time": "Kemarin",
      "unread": 0,
      "avatarColor": Colors.blue,
    },
    {
      "name": "Abdul Aziz",
      "message": "Oke makasih infonya!",
      "time": "25/10/26",
      "unread": 0,
      "avatarColor": Colors.brown,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 1. APPBAR (Warna Hijau WhatsApp + Action Icons)
      appBar: AppBar(
        title: const Text(
          'WhatsApp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        backgroundColor: const Color(0xFF075E54),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),

      // 2. DRAWER (Profil Pembuat Tugas & Menu Account/Privacy)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                namaPembuat,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                "NIM: $nimPembuat\nProdi: $kelasPembuat",
                style: const TextStyle(color: Colors.white70),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Color(0xFF075E54),
                ),
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF075E54),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.key, color: Color(0xFF075E54)),
              title: const Text('Account'),
              subtitle: const Text('Notifikasi keamanan, ganti nomor'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.lock, color: Color(0xFF075E54)),
              title: const Text('Privacy'),
              subtitle: const Text('Blokir kontak, pesan sementara'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.chat, color: Color(0xFF075E54)),
              title: const Text('Chats'),
              subtitle: const Text('Tema, wallpaper, riwayat chat'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications, color: Color(0xFF075E54)),
              title: const Text('Notifications'),
              subtitle: const Text('Nada pesan, grup & panggilan'),
              onTap: () {},
            ),
          ],
        ),
      ),

      // 3. BODY (ListView Pesan / Updates / Calls)
      body: _buildBody(),

      // FAB Tombol Chat Baru ala WhatsApp
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF25D366),
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),

      // 4. NAVIGATIONBAR BAWAH (Chats | Updates | Calls)
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        indicatorColor: const Color(0xFF25D366).withOpacity(0.3),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.chat_outlined),
            selectedIcon: Icon(Icons.chat, color: Color(0xFF075E54)),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.update_outlined),
            selectedIcon: Icon(Icons.update, color: Color(0xFF075E54)),
            label: 'Updates',
          ),
          NavigationDestination(
            icon: Icon(Icons.call_outlined),
            selectedIcon: Icon(Icons.call, color: Color(0xFF075E54)),
            label: 'Calls',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_currentIndex == 0) {
      return ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final item = chatList[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: item["avatarColor"],
              child: Text(
                item["name"][0],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            title: Text(
              item["name"],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                item["message"],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black54),
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  item["time"],
                  style: TextStyle(
                    fontSize: 12,
                    color: item["unread"] > 0 ? const Color(0xFF25D366) : Colors.grey,
                    fontWeight: item["unread"] > 0 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                if (item["unread"] > 0) ...[
                  const SizedBox(height: 4),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: const Color(0xFF25D366),
                    child: Text(
                      '${item["unread"]}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            // 5. STACK NAVIGATION (Pindah ke ChatDetailScreen saat item ditekan)
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailScreen(
                    contactName: item["name"],
                    avatarColor: item["avatarColor"],
                    lastMessage: item["message"],
                  ),
                ),
              );
            },
          );
        },
      );
    } else if (_currentIndex == 1) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.update, size: 64, color: Colors.grey),
            SizedBox(height: 8),
            Text('Halaman Status / Updates', style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    } else {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.call, size: 64, color: Colors.grey),
            SizedBox(height: 8),
            Text('Halaman Riwayat Panggilan', style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }
  }
}

// Layar Chat Detail (Mencontoh UI Obrolan WhatsApp)
class ChatDetailScreen extends StatelessWidget {
  final String contactName;
  final Color avatarColor;
  final String lastMessage;

  const ChatDetailScreen({
    super.key,
    required this.contactName,
    required this.avatarColor,
    required this.lastMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE5DD), // Warna latar khas WhatsApp
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: const Color(0xFF075E54),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: avatarColor,
              child: Text(
                contactName[0],
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contactName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'online',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
          IconButton(icon: const Icon(Icons.call), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Bubble Pesan
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      lastMessage,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7FFDB), // Warna bubble pengirim WA
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Siap, terima kasih!',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bar Input Pesan
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Ketik pesan',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.attach_file, color: Colors.grey),
                        SizedBox(width: 8),
                        Icon(Icons.camera_alt, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                const CircleAvatar(
                  backgroundColor: Color(0xFF075E54),
                  radius: 22,
                  child: Icon(Icons.mic, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}