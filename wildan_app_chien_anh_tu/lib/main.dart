import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sinh Tồn Cúc Phương',
      debugShowCheckedModeBanner: false, // Ẩn chữ Debug góc phải cho giống app thật
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
  // ========================================================================
  // YÊU CẦU 1: THỰC HIỆN SỬ DỤNG CÁC BIẾN (Forest, People, Survival)
  // ========================================================================
  
  // Biến đối tượng Forest
  String forestName = "Vườn Quốc gia Cúc Phương";
  double temperature = 26.5;

  // Biến đối tượng People (Trạng thái chung của nhóm)
  int teamHealthPoints = 100;
  bool isRaining = false;

  // Biến đối tượng Survival
  int daysSurvived = 2;
  String targetLocation = "Cây Chò Ngàn Năm";

  // ========================================================================
  // YÊU CẦU 2: THỰC HIỆN SỬ DỤNG COLLECTIONS (Array, List, Map)
  // ========================================================================
  
  // Sử dụng List: Danh sách đội ngũ sinh tồn (Đối tượng con người)
  final List<String> teamMembers = <String>['Chiến', 'Tú', 'Đức Anh'];

  // Sử dụng List: Hành trang mang theo
  final List<String> inventory = <String>['Thuốc chống vắt', 'Đèn pin', 'Áo mưa', 'Bản đồ', 'Lều trại'];
  
  // Sử dụng Map: Đánh giá thể lực từng thành viên trong nhóm
  final Map<String, int> staminaMap = {
    'Chiến': 95,
    'Tú': 88,
    'Đức Anh': 90,
  };

  @override
  Widget build(BuildContext context) {
    // Dùng Scaffold để tạo khung chuẩn cho giao diện App Mobile
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Nền app màu xám nhạt để nổi bật các Card
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      // Body cho phép cuộn trên mobile
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            // ========================================================================
            // YÊU CẦU 3: HIỂN THỊ DỮ LIỆU TỪ BIẾN VÀ COLLECTIONS TRONG BUILD
            // ========================================================================

            // --- 1. HIỂN THỊ CÁC BIẾN (YÊU CẦU 1) ---
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

            // --- 2. HIỂN THỊ LIST BẰNG DẠNG ROW (YÊU CẦU 2 & 3) ---
            const Text('🧑 NHÓM SINH TỒN ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue)),
            Card(
              elevation: 2,
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Cuộn ngang cho app mobile
                  child: Row(
                    children: [
                      const Icon(Icons.group, color: Colors.blue),
                      const SizedBox(width: 8),
                      // Sử dụng vòng lặp for trong Row đúng như đề bài yêu cầu
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

            // --- 3. HIỂN THỊ MAP BẰNG DẠNG ROW (YÊU CẦU 2 & 3) ---
            const Text('🔋 THỂ LỰC THÀNH VIÊN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.orange)),
            Card(
              elevation: 2,
              color: Colors.orange.shade50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // Sử dụng cấu trúc .map().toList() đúng như đề bài yêu cầu
                    children: staminaMap.entries.map((entry) => 
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Row(
                          children: [
                            const Icon(Icons.battery_charging_full, size: 20, color: Colors.orange),
                            const SizedBox(width: 4),
                            Text('${entry.key}: ${entry.value}%', style: const TextStyle(fontSize: 15)),
                          ],
                        ),
                      )
                    ).toList(),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // --- 4. HÀNH TRANG ---
            const Text('🎒 HÀNH TRANG (Hiển thị List mở rộng)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal)),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    ...inventory.map((item) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.teal.shade200)
                      ),
                      child: Text(item),
                    ))
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}