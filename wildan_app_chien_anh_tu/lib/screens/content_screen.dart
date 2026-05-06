import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int totalItems = DummyData.animals.length + DummyData.plants.length + DummyData.skills.length;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Tiêu đề (Style giống "Basket - 3 items" trên Figma)
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const Text(
                  'Cẩm nang toàn thư',
                  style: TextStyle(
                      fontSize: 42, 
                      fontWeight: FontWeight.bold, 
                      fontFamily: 'Times New Roman', // Font có chân giống Figma
                      color: Color(0xFF1E3A1A)),
                ),
                const SizedBox(width: 16),
                Text(
                  '$totalItems mục',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.grey.shade300, thickness: 1),
            const SizedBox(height: 20),

            // 2. Chia Layout 2 cột (Cột trái: Danh sách, Cột phải: Summary)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- CỘT TRÁI: DANH SÁCH MỤC ---
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeader('Động vật', Icons.pets, Colors.red),
                      ...DummyData.animals.map((e) => _buildFigmaCardItem(e.name, 'Động vật', Icons.pets, Colors.red)),
                      
                      _buildSectionHeader('Thực vật', Icons.eco, Colors.green),
                      ...DummyData.plants.map((e) => _buildFigmaCardItem(e.name, 'Thực vật', Icons.eco, Colors.green)),
                      
                      _buildSectionHeader('Kỹ năng', Icons.local_fire_department, Colors.orange),
                      ...DummyData.skills.map((e) => _buildFigmaCardItem(e.name, 'Kỹ năng', Icons.local_fire_department, Colors.orange)),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                
                // --- CỘT PHẢI: BẢNG TỔNG QUAN (Style giống Order Summary) ---
                Expanded(
                  flex: 1,
                  child: _buildSummaryBox(totalItems),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Header của từng danh mục
  Widget _buildSectionHeader(String title, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 10),
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  // Widget hiển thị từng mục theo Style Sản phẩm của Figma
  Widget _buildFigmaCardItem(String title, String categoryName, IconData icon, Color iconColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9F6), // Màu nền xám nhạt của Figma
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Khu vực hình ảnh (Được thay bằng Icon vuông vắn)
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            child: Container(
              width: 100,
              height: 100,
              color: iconColor.withOpacity(0.1),
              child: Icon(icon, size: 40, color: iconColor),
            ),
          ),
          const SizedBox(width: 20),
          // Thông tin text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 12),
                // Nút "pill" (Hình viên thuốc) giống nút chọn khối lượng trong Figma
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(categoryName, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Colors.grey.shade700)),
                      const SizedBox(width: 8),
                      Icon(Icons.category, size: 14, color: Colors.grey.shade400),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget hiển thị Bảng tóm tắt (Giống Order Summary)
  Widget _buildSummaryBox(int totalItems) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tổng quan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 20),
          _summaryRow('Động vật', '${DummyData.animals.length} mục'),
          const SizedBox(height: 12),
          _summaryRow('Thực vật', '${DummyData.plants.length} mục'),
          const SizedBox(height: 12),
          _summaryRow('Kỹ năng', '${DummyData.skills.length} mục'),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 12),
          _summaryRow('Tổng cộng', '$totalItems mục', isBold: true),
          const SizedBox(height: 24),
          // Nút xanh lá giống nút "Continue to payment"
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF387E12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Khám phá ngay', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String title, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.w500, fontSize: 16)),
        Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.w500, fontSize: 16)),
      ],
    );
  }
}