import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 1. Banner Phong cách Sinh tồn
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green.shade900,
              image: const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?q=80&w=1000'),
                fit: BoxFit.cover,
                opacity: 0.6,
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

          // 2. Nội dung chi tiết
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

                // Tiêu chí cốt lõi của App
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

                // ==========================================
                // PHẦN MỚI: TÓM TẮT TÍNH NĂNG ỨNG DỤNG
                // ==========================================
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '🌟 Tính năng nổi bật:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ),
                const SizedBox(height: 15),
                
                _buildFeatureSummary(
                  title: 'Động vật hoang dã',
                  icon: Icons.pets,
                  color: Colors.red.shade400,
                  description: 'Cung cấp thông tin nhận diện, tập tính và cách phòng tránh các loài động vật nguy hiểm đặc trưng tại Rừng Cúc Phương.',
                ),
                
                _buildFeatureSummary(
                  title: 'Thực vật bản địa',
                  icon: Icons.eco,
                  color: Colors.green.shade600,
                  description: 'Cẩm nang phân biệt các loài cây có độc để né tránh, đồng thời nhận biết các loại thực vật có thể cung cấp nguồn nước và hỗ trợ sơ cứu.',
                ),
                
                _buildFeatureSummary(
                  title: 'Kỹ năng sinh tồn',
                  icon: Icons.local_fire_department,
                  color: Colors.orange.shade600,
                  description: 'Hướng dẫn chi tiết các kỹ năng thực chiến như định hướng bằng tự nhiên, phương pháp lọc nước và kỹ thuật dựng lán trại an toàn.',
                ),

                _buildFeatureSummary(
                  title: 'Dụng cụ & Trang bị',
                  icon: Icons.build,
                  color: Colors.blue.shade600,
                  description: 'Danh sách các vật dụng thiết yếu cần chuẩn bị và mẹo tận dụng, chế tạo công cụ từ những vật liệu có sẵn trong rừng.',
                ),
                // ==========================================

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
                
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget hiển thị tóm tắt từng danh mục
  Widget _buildFeatureSummary({
    required String title, 
    required IconData icon, 
    required Color color, 
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.grey.shade800
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14, 
                      color: Colors.grey.shade600,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm tạo Card thành viên
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