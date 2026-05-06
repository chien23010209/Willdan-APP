// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'category_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Nếu bạn đã có Scaffold ở MainLayout thì dùng Container, nếu không thì bọc bằng Scaffold
    return Container(
      color: const Color(0xFFF5F5F5), // Màu nền xám nhạt hệt như trong hình mẫu Figma
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa toàn bộ
            children: [
              // 1. Khối Title (Chữ rất to, đen đậm)
              const Text(
                'Tra Cứu Sinh Tồn',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2D2D2D),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              
              // 2. Khối Subtitle (Chữ nhỏ hơn, xám đen)
              const Text(
                'Rừng Quốc gia Cúc Phương',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF4A4A4A),
                ),
              ),
              const SizedBox(height: 40),

              // 3. Khối Form (Nền trắng, bo góc, viền mờ)
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 400), // Giới hạn chiều rộng để form không bị bè ra quá dài trên tablet/web
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFormRow(
                      context,
                      label: 'Động vật',
                      placeholderText: 'Tra cứu thú, bò sát, côn trùng...',
                      icon: Icons.pets,
                      categoryType: 'Animal',
                      color: Colors.red.shade700,
                    ),
                    const SizedBox(height: 20),
                    
                    _buildFormRow(
                      context,
                      label: 'Thực vật',
                      placeholderText: 'Tra cứu cây thuốc, nấm ăn...',
                      icon: Icons.eco,
                      categoryType: 'Plant',
                      color: Colors.green.shade700,
                    ),
                    const SizedBox(height: 20),
                    
                    _buildFormRow(
                      context,
                      label: 'Kỹ năng',
                      placeholderText: 'Nhóm lửa, dựng lán, sơ cứu...',
                      icon: Icons.local_fire_department,
                      categoryType: 'Skill',
                      color: Colors.orange.shade700,
                    ),
                    const SizedBox(height: 20),
                    
                    _buildFormRow(
                      context,
                      label: 'Dụng cụ',
                      placeholderText: 'Dao, đá lửa, dây thừng...',
                      icon: Icons.handyman,
                      categoryType: 'Tool',
                      color: Colors.blue.shade700,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hàm tạo từng hàng giống hệt TextField trong form mẫu
  Widget _buildFormRow(BuildContext context, {
    required String label, 
    required String placeholderText, 
    required IconData icon, 
    required String categoryType, 
    required Color color
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label (Giống các chữ "Name", "Surname", "Email" trong hình mẫu)
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        
        // Ô input (Thay vì gõ chữ, mình biến nó thành nút bấm chuyển trang)
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoryListScreen(categoryType: categoryType, title: label, color: color)),
            );
          },
          borderRadius: BorderRadius.circular(6),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey.shade300), // Viền xám mờ chuẩn form
            ),
            child: Row(
              children: [
                Icon(icon, size: 20, color: color),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    placeholderText, // Hiển thị giống chữ "Value" mờ mờ trong form mẫu
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade400, 
                    ),
                  ),
                ),
                Icon(Icons.search, size: 18, color: Colors.grey.shade400),
              ],
            ),
          ),
        ),
      ],
    );
  }
}