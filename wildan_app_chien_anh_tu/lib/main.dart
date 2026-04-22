// File: lib/main.dart
import 'package:flutter/material.dart';

// Đảm bảo bạn đã có 2 file này trong cùng thư mục lib/
import 'Wildlife.dart';
import 'ListWildlife.dart';

void main() {
  runApp(const SurvivalApp());
}

class SurvivalApp extends StatelessWidget {
  const SurvivalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Sinh Tồn',
      debugShowCheckedModeBanner: false,
      // Tone màu xanh lá rừng chủ đạo
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade800),
        useMaterial3: true,
      ),
      home: const SurvivalHomePage(),
    );
  }
}

class SurvivalHomePage extends StatefulWidget {
  const SurvivalHomePage({super.key});

  @override
  State<SurvivalHomePage> createState() => _SurvivalHomePageState();
}

class _SurvivalHomePageState extends State<SurvivalHomePage> {
  // --- THÔNG TIN CHUNG CỦA DỰ ÁN (Phần cũ giữ lại) ---
  final String location = "Rừng Cúc Phương";
  final double temperature = 28.5;
  final int survivalDays = 3;
  final List<String> inventory = ['Dao găm', 'Bật lửa', 'Bản đồ', 'Lọc nước'];

  // --- QUẢN LÝ DỮ LIỆU ĐỘNG VẬT (CRUD) ---
  final ListWildlife wildlifeManager = ListWildlife();

  @override
  void initState() {
    super.initState();
    // Tạo dữ liệu ban đầu
    wildlifeManager.addWildlife(Wildlife(
      id: 1, 
      name: 'Rắn lục đuôi đỏ', 
      species: 'Bò sát',
      habitat: 'Bụi rậm, vắt vẻo trên cành cây nhỏ',
      dangerLevel: 'Rất Cao', 
      isPoisonous: true,
      behavior: 'Săn mồi ban đêm, giỏi ngụy trang.',
      firstAidTip: 'Băng ép bất động (không garo chặt), chuyển cấp cứu ngay.'
    ));

    wildlifeManager.addWildlife(Wildlife(
      id: 2, 
      name: 'Khỉ Macaque', 
      species: 'Động vật có vú',
      habitat: 'Tán cây cao, ven đường mòn',
      dangerLevel: 'Thấp', 
      isPoisonous: false,
      behavior: 'Sống bầy đàn, hay tò mò và ăn trộm đồ.',
      firstAidTip: 'Nếu bị cắn/cào, rửa sạch bằng xà phòng và tiêm phòng dại.'
    ));
    wildlifeManager.addWildlife(Wildlife(
      id: 3, 
      name: 'Vắt rừng', 
      species: 'Giun đốt',
      habitat: 'Thảm lá mục, ven suối, nơi ẩm ướt',
      dangerLevel: 'Thấp', 
      isPoisonous: false,
      behavior: 'Bám vào khe hở quần áo để hút máu. Tiết chất gây tê nên người bị cắn không có cảm giác đau.',
      firstAidTip: 'Bôi vôi, rắc muối hoặc dùng bật lửa hơ gần để vắt tự rụng. Rửa sạch và dán băng cá nhân bịt vết thương.'
    ));

    wildlifeManager.addWildlife(Wildlife(
      id: 4, 
      name: 'Rết khổng lồ', 
      species: 'Động vật chân khớp',
      habitat: 'Dưới kẽ đá, gốc cây mục, nơi tối và ẩm',
      dangerLevel: 'Trung bình', 
      isPoisonous: true,
      behavior: 'Tấn công rất nhanh khi bị đe dọa hoặc vô tình chạm phải lúc dọn củi, lật tảng đá.',
      firstAidTip: 'Rửa vết cắn bằng xà phòng, chườm lạnh để giảm sưng đau. Nếu có triệu chứng khó thở, phải tìm y tế ngay.'
    ));

    wildlifeManager.addWildlife(Wildlife(
      id: 5, 
      name: 'Gấu ngựa', 
      species: 'Động vật có vú (Thú lớn)',
      habitat: 'Rừng sâu, khu vực có nhiều hang động',
      dangerLevel: 'Cực cao', 
      isPoisonous: false,
      behavior: 'Bảo vệ lãnh thổ và con non cực kỳ gắt gao. Khứu giác tốt, chạy và trèo cây rất nhanh.',
      firstAidTip: 'Không bỏ chạy. Lùi lại từ từ, nói chuyện nhẹ nhàng. Nếu bị tấn công: Nằm cuộn tròn, ôm chặt bảo vệ gáy và bụng.'
    ));

    wildlifeManager.addWildlife(Wildlife(
      id: 6, 
      name: 'Nhện rừng', 
      species: 'Lớp nhện',
      habitat: 'Hang đất, thân cây cổ thụ, đôi khi lẩn vào balo',
      dangerLevel: 'Cao', 
      isPoisonous: true,
      behavior: 'Hay chui vào giày, quần áo, túi ngủ để tìm hơi ấm qua đêm. Cắn khi bị kẹt hoặc đè lên.',
      firstAidTip: 'Rửa sạch bằng xà phòng, chườm đá. Tuyệt đối không rạch vết thương hay cố nặn nọc độc. Theo dõi nhịp tim.'
    ));
  }

  // CREATE: Hàm thêm mới
  void _createNewWildlife() {
    setState(() {
      int newId = wildlifeManager.collection.isEmpty ? 1 : wildlifeManager.collection.last.id + 1;
      wildlifeManager.addWildlife(Wildlife(
        id: newId, 
        name: 'Loài mới chưa rõ ($newId)', 
        species: 'Chưa phân loại',
        habitat: 'Đang khảo sát',
        dangerLevel: 'Chưa đánh giá', 
        isPoisonous: false,
        behavior: 'Cần quan sát thêm',
        firstAidTip: 'Giữ khoảng cách an toàn ít nhất 10m.'
      ));
    });
  }

  // EDIT: Hàm cập nhật thông tin trực tiếp 1 bản ghi
  void _editWildlifeInfo(int targetId) {
    setState(() {
      wildlifeManager.editWildlife(
        id: targetId, 
        newName: 'Đã cập nhật thông tin mới', 
        newSpecies: 'Đã xác định', 
        newHabitat: 'Cập nhật từ bản đồ', 
        newDangerLevel: 'Cực Cao', 
        newIsPoisonous: true, 
        newBehavior: 'Rất hung hăng khi bị làm phiền.', 
        newFirstAidTip: 'Lập tức gọi trực thăng cứu hộ.'
      );
    });
    // Hiển thị thông báo nhỏ ở dưới màn hình
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đã cập nhật thông tin cho ID: $targetId'), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Wildlife> currentWildlife = wildlifeManager.readAll();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('⛺ Cẩm Nang Sinh Tồn', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // ==========================================
          // PHẦN 1: BẢNG ĐIỀU KHIỂN (DASHBOARD)
          // ==========================================
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.green.shade800,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('📍 Địa điểm: $location', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                    Text('Ngày thứ $survivalDays', style: const TextStyle(color: Colors.yellow, fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                Text('🌡️ Nhiệt độ môi trường: $temperature°C', style: const TextStyle(color: Colors.white70, fontSize: 14)),
                const Divider(color: Colors.white30, height: 24),
                const Text('🎒 Hành trang hiện tại:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  children: inventory.map((item) => Chip(
                    label: Text(item, style: const TextStyle(fontSize: 12)),
                    backgroundColor: Colors.white24,
                    labelStyle: const TextStyle(color: Colors.white),
                    side: BorderSide.none,
                  )).toList(),
                ),
              ],
            ),
          ),

          // ==========================================
          // PHẦN 2: TỪ ĐIỂN ĐỘNG VẬT (CRUD LIST)
          // ==========================================
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('🐾 TỪ ĐIỂN ĐỘNG VẬT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87)),
                Text('${currentWildlife.length} loài', style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('💡 Vuốt sang trái để XÓA | Bấm nút ✏️ để SỬA', style: TextStyle(fontSize: 12, color: Colors.blueGrey, fontStyle: FontStyle.italic)),
            ),
          ),
          const SizedBox(height: 8),

          // Danh sách cuộn được
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: currentWildlife.length,
              itemBuilder: (context, index) {
                final animal = currentWildlife[index];
                
                // Thuộc tính Dismissible cho phép vuốt để xóa (DELETE)
                return Dismissible(
                  key: Key(animal.id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(color: Colors.red.shade400, borderRadius: BorderRadius.circular(12)),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    setState(() { wildlifeManager.deleteWildlife(animal.id); });
                  },
                  child: Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    // ExpansionTile giúp hiển thị chi tiết khi bấm vào (READ chi tiết)
                    child: ExpansionTile(
                      leading: CircleAvatar(
                        backgroundColor: animal.isPoisonous ? Colors.red.shade100 : Colors.green.shade100,
                        child: Text('${animal.id}', style: TextStyle(color: animal.isPoisonous ? Colors.red : Colors.green, fontWeight: FontWeight.bold)),
                      ),
                      title: Text(animal.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      subtitle: Text('${animal.species} | ${animal.getWarning()}'),
                      childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(),
                        Text('📍 Nơi sống:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green.shade800)),
                        Text(animal.habitat),
                        const SizedBox(height: 8),
                        Text('🧠 Tập tính:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown.shade800)),
                        Text(animal.behavior),
                        const SizedBox(height: 8),
                        Text('⚠️ Mức độ nguy hiểm:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red.shade800)),
                        Text(animal.dangerLevel),
                        const SizedBox(height: 8),
                        Text('🏥 Mẹo sơ cứu:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade800)),
                        Text(animal.firstAidTip, style: const TextStyle(fontStyle: FontStyle.italic)),
                        const SizedBox(height: 12),
                        
                        // Nút Sửa (EDIT) được tích hợp thẳng vào từng con vật
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton.icon(
                            onPressed: () => _editWildlifeInfo(animal.id), 
                            icon: const Icon(Icons.edit, size: 16), 
                            label: const Text('Cập nhật nhanh'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange.shade100,
                              foregroundColor: Colors.orange.shade900,
                              elevation: 0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // Nút Nổi (Floating Action Button) để thêm mới (CREATE)
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createNewWildlife,
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Phát hiện loài mới'),
      ),
    );
  }
}