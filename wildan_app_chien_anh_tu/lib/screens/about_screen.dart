import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Bỏ padding ở đây để Banner có thể tràn viền màn hình
      child: Column(
        children: [
          // 1. Banner Phong cách Sinh tồn hoang dã
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green.shade900,
              image: const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?q=80&w=1000'),
                fit: BoxFit.cover,
                opacity: 0.6, // Làm tối ảnh nền để chữ nổi bật hơn
              ),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.landscape, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'SINH TỒN CÚC PHƯƠNG',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 2. Nội dung chi tiết (Có padding)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Thông tin trường
                Icon(Icons.school, size: 50, color: Colors.green.shade800),
                const SizedBox(height: 10),
                const Text(
                  'ĐẠI HỌC CÔNG NGHỆ THÔNG TIN PHENIKAA',
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.green
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 25),

                // Tiêu chí cốt lõi của App (Được highlight trong khung)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.green.shade200),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.info_outline, color: Colors.green.shade700),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Dự án cung cấp kiến thức sinh tồn dựa trên thực tế, tuân thủ nguyên tắc phi trò chơi (không thanh sinh lực, không gamification).',
                          style: TextStyle(
                            fontSize: 14, 
                            color: Colors.black87, 
                            height: 1.5,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Danh sách thành viên
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '👥 Đội ngũ phát triển:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),
                _buildMemberCard('Tạ Công Chiến', '23010209'),
                _buildMemberCard('Nguyễn Văn Tú', '23010109'),
                _buildMemberCard('Nguyễn Lê Đức Anh', '23010246'),
                
                const SizedBox(height: 40), // Khoảng trống dưới cùng để cuộn mượt hơn
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Hàm tạo Card thành viên được thiết kế lại đẹp hơn
  Widget _buildMemberCard(String name, String id) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.green.shade100,
          child: Icon(Icons.person, color: Colors.green.shade800),
        ),
        title: Text(
          name, 
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
        ),
        subtitle: Text(
          'MSSV: $id', 
          style: TextStyle(color: Colors.grey.shade600)
        ),
        trailing: Icon(Icons.check_circle, color: Colors.green.shade400, size: 20),
      ),
    );
  }
}