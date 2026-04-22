import 'package:flutter/material.dart';

// Import 2 file của Câu 3 và Câu 4
import 'SurvivalKit.dart';
import 'ListSurvivalKit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sinh Tồn Cúc Phương',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const CucPhuongSurvivalPage(title: 'Hành Trình Rừng Cúc Phương'),
    );
  }
}

class CucPhuongSurvivalPage extends StatefulWidget {
  const CucPhuongSurvivalPage({super.key, required this.title});
  final String title;

  @override
  State<CucPhuongSurvivalPage> createState() => _CucPhuongSurvivalPageState();
}

class _CucPhuongSurvivalPageState extends State<CucPhuongSurvivalPage> {
  // Biến cơ bản (YÊU CẦU 1)
  String forestName = "Vườn Quốc gia Cúc Phương";
  double temperature = 26.5;
  int teamHealthPoints = 100;
  bool isRaining = false;
  int daysSurvived = 2;
  String targetLocation = "Cây Chò Ngàn Năm";

  // Collections (YÊU CẦU 2)
  final List<String> teamMembers = <String>['Chiến', 'Tú', 'Đức Anh'];
  final Map<String, int> staminaMap = {'Chiến': 95, 'Tú': 88, 'Đức Anh': 90};

  final List<Map<String, dynamic>> listForest = [
    {'id': 1, 'name': 'Rừng Cúc Phương'}, 
    {'id': 2, 'name': 'Vườn Quốc Gia Ba Vì'}, 
    {'id': 3, 'name': 'Rừng U Minh'},
    {'id': 4, 'name': 'Rừng Tràm'}
  ];

  // ========================================================================
  // KẾT NỐI CÂU 3 & CÂU 4 VÀO GIAO DIỆN APP
  // ========================================================================
  late ListSurvivalKit kitManager;

  @override
  void initState() {
    super.initState();
    kitManager = ListSurvivalKit();
    
    // Tự động thêm 2 dụng cụ mẫu khi mở App
    kitManager.createKit(1, "Dao đi rừng", "Cắt gọt, tự vệ", 2);
    kitManager.createKit(2, "Bật lửa", "Tạo lửa sưởi ấm", 5);
  }

  // THÊM (CREATE) GIAO DIỆN
  void _addKitOnScreen() {
    setState(() {
      // Tìm ID mới nhất để không bị trùng
      int newId = kitManager.kits.isNotEmpty ? kitManager.kits.last.id + 1 : 1;
      kitManager.createKit(newId, "Dụng cụ mới $newId", "Chưa xác định", 1);
    });
  }

  // SỬA (EDIT) GIAO DIỆN
  void _editKitOnScreen(int id) {
    setState(() {
      kitManager.editKit(id, "Đồ đã nâng cấp", 99); 
    });
  }

  // XÓA (DELETE) GIAO DIỆN
  void _deleteKitOnScreen(int id) {
    setState(() {
      // Dùng lệnh removeWhere để tìm và xóa đối tượng có ID tương ứng
      kitManager.kits.removeWhere((kit) => kit.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            // --- 1. HIỂN THỊ CÁC BIẾN ---
            const Text('🌲 THÔNG TIN HÀNH TRÌNH', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green)),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Địa điểm: $forestName'),
                    Text('Nhiệt độ: $temperature°C | Thời tiết: ${isRaining ? "Đang mưa" : "Tạnh ráo"}'),
                    const Divider(),
                    Text('Mục tiêu: $targetLocation'),
                    Text('Thời gian đi rừng: Ngày thứ $daysSurvived'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // --- 2. HIỂN THỊ NHÓM SINH TỒN ---
            const Text('🧑 NHÓM SINH TỒN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue)),
            Card(
              elevation: 2,
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Icon(Icons.group, color: Colors.blue),
                      const SizedBox(width: 8),
                      for (var member in teamMembers) 
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            avatar: const Icon(Icons.person, size: 16),
                            label: Text(member, style: const TextStyle(fontWeight: FontWeight.bold)),
                            backgroundColor: Colors.white,
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // --- 3. HIỂN THỊ DANH SÁCH RỪNG ---
            const Text('🗺️ DANH SÁCH RỪNG', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.purple)),
            Card(
              elevation: 2,
              child: Column(
                children: listForest.map((forest) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple.shade100,
                        child: Text('${forest['id']}', style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                      ),
                      title: Text('${forest['name']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    if (forest != listForest.last) const Divider(height: 1, indent: 16, endIndent: 16),
                  ],
                )).toList(),
              ),
            ),
            const SizedBox(height: 24),

            // ========================================================================
            // --- 4. GIAO DIỆN CRUD: THÊM, ĐỌC, SỬA, XÓA DỤNG CỤ ---
            // ========================================================================
            const Text('🎒 QUẢN LÝ DỤNG CỤ SINH TỒN (CRUD)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.brown)),
            Card(
              elevation: 2,
              child: Column(
                // ĐỌC (READ)
                children: kitManager.kits.map((kit) => Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.handyman, color: Colors.brown, size: 30),
                      title: Text(kit.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Công dụng: ${kit.function} \nSố lượng: ${kit.quantity}'),
                      
                      // Cụm nút Sửa và Xóa
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min, // Giúp 2 icon không bị chiếm hết chiều ngang
                        children: [
                          // Nút SỬA (EDIT)
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _editKitOnScreen(kit.id),
                          ),
                          // Nút XÓA (DELETE)
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteKitOnScreen(kit.id),
                          ),
                        ],
                      ),
                    ),
                    if (kit != kitManager.kits.last) const Divider(height: 1, indent: 16, endIndent: 16),
                  ],
                )).toList(),
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Nút THÊM (CREATE) nằm ở dưới cùng
            ElevatedButton.icon(
              onPressed: _addKitOnScreen,
              icon: const Icon(Icons.add),
              label: const Text("Thêm Dụng Cụ Mới"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown.shade100,
                foregroundColor: Colors.brown.shade900,
                padding: const EdgeInsets.symmetric(vertical: 16)
              ),
            ),
            const SizedBox(height: 32),

          ],
        ),
      ),
    );
  }
}