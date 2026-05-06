import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- TIÊU ĐỀ TRANG ---
          const Text(
            'Hành trang sinh tồn',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w600,
              fontFamily: 'Times New Roman',
              color: Colors.black87,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(thickness: 1, color: Color(0xFFE0E0E0)),
          const SizedBox(height: 32),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- CỘT TRÁI (DANH SÁCH 4 MỤC) ---
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    // I. ĐỘNG VẬT
                    _buildSectionHeader('I. ĐỘNG VẬT NGUY HIỂM', Icons.pets, Colors.red),
                    ...DummyData.animals.map((item) => _buildItemCard(
                          title: item.name,
                          subtitle: 'Cảnh báo: ${item.dangerLevel}',
                          description: item.description,
                          imagePath: item.imagePath,
                          statusColor: Colors.red,
                        )),

                    const SizedBox(height: 40),

                    // II. THỰC VẬT
                    _buildSectionHeader('II. THỰC VẬT RỪNG', Icons.eco, Colors.green),
                    ...DummyData.plants.map((item) => _buildItemCard(
                          title: item.name,
                          subtitle: 'Độc tính: ${item.toxicity}',
                          description: item.usage,
                          imagePath: item.imagePath, // Đảm bảo class Plant đã thêm biến này
                          statusColor: Colors.green,
                        )),

                    const SizedBox(height: 40),

                    // III. KỸ NĂNG (Dùng steps.first để hiển thị mô tả ngắn)
                    _buildSectionHeader('III. KỸ NĂNG SINH TỒN', Icons.bolt, Colors.orange),
                    ...DummyData.skills.map((item) => _buildItemCard(
                          title: item.name,
                          subtitle: 'Kỹ năng cốt yếu',
                          description: item.steps.isNotEmpty ? item.steps.first : 'Xem chi tiết',
                          imagePath: item.imagePath,
                          statusColor: Colors.orange,
                        )),

                    const SizedBox(height: 40),

                    // IV. DỤNG CỤ
                    _buildSectionHeader('IV. DỤNG CỤ MANG THEO', Icons.handyman, Colors.blue),
                    ...DummyData.tools.map((item) => _buildItemCard(
                          title: item.name,
                          subtitle: 'Tầm quan trọng: ${item.importance}',
                          description: item.usage,
                          imagePath: item.imagePath,
                          statusColor: Colors.blue,
                        )),
                  ],
                ),
              ),

              const SizedBox(width: 40),

              // --- CỘT PHẢI (BẢNG TỔNG HỢP) ---
              Expanded(
                flex: 4,
                child: _buildRightSummary(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget Tiêu đề Section
  Widget _buildSectionHeader(String title, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 12),
          Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  // Widget Card Item (Đã tối ưu để hiển thị mô tả dài)
  Widget _buildItemCard({
    required String title,
    required String subtitle,
    required String description,
    required String imagePath,
    required Color statusColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5)],
      ),
      child: Row(
        children: [
          Container(
            width: 130, height: 130,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
              child: imagePath.isNotEmpty
                  ? Image.asset(imagePath, fit: BoxFit.cover)
                  : Icon(Icons.image, size: 40, color: Colors.grey.shade400),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: TextStyle(fontSize: 14, color: statusColor, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Text(description, 
                    maxLines: 2, 
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade700)
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Cột phải: Tổng hợp kiểm tra
  Widget _buildRightSummary() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Danh mục kiểm tra', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          _row('Động vật nguy hiểm', '${DummyData.animals.length} loài'),
          _row('Thực vật nhận biết', '${DummyData.plants.length} loài'),
          _row('Kỹ năng sinh tồn', '${DummyData.skills.length} bài'),
          _row('Dụng cụ chuẩn bị', '${DummyData.tools.length} món'),
          const Divider(height: 40),
          _row('Sẵn sàng hành trình', '100%', isBold: true),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF426B1F),
              minimumSize: const Size(double.infinity, 55),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('XÁC NHẬN LÊN ĐƯỜNG', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget _row(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.w500)),
        ],
      ),
    );
  }
}