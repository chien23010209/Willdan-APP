import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Padding lớn 2 bên để tạo phong cách Web
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Khối Header giống phần "We're farmers..."
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Đại học Công nghệ Thông tin\nPhenikaa',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 56,
                fontFamily: 'Times New Roman', // Font có chân sang trọng
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                letterSpacing: -1.0,
                height: 1.1,
              ),
            ),
          ),
          
          const SizedBox(height: 80),

          // 2. Khối Nội dung 2 cột giống phần "WHAT WE BELIEVE"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                // Row 1: Danh sách thành viên
                _buildInfoSection(
                  title: 'THÀNH VIÊN NHÓM',
                  contentWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMemberRow('Tạ Công Chiến', '23010209'),
                      const SizedBox(height: 16),
                      _buildMemberRow('Nguyễn Văn Tú', '23010109'),
                      const SizedBox(height: 16),
                      _buildMemberRow('Nguyễn Lê Đức Anh', '23010246'),
                    ],
                  ),
                ),
                
                const SizedBox(height: 60),
                const Divider(color: Color(0xFFE0E0E0), thickness: 1),
                const SizedBox(height: 60),
                
                // Row 2: Về dự án
                _buildInfoSection(
                  title: 'VỀ DỰ ÁN',
                  contentWidget: const Text(
                    'Dự án cung cấp kiến thức sinh tồn dựa trên thực tế, tuân thủ nguyên tắc phi trò chơi (không thanh sinh lực, không gamification).',
                    style: TextStyle(
                      fontSize: 20, // Chữ to, dễ đọc như bản mẫu
                      height: 1.6,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget khung chia 2 cột: Trái (Tiêu đề nhỏ) - Phải (Nội dung)
  Widget _buildInfoSection({required String title, required Widget contentWidget}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cột trái chiếm một khoảng width cố định
        SizedBox(
          width: 250,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5, // Chữ in hoa cách xa nhau
              color: Colors.black,
            ),
          ),
        ),
        // Cột phải chứa nội dung linh hoạt
        Expanded(
          child: contentWidget,
        ),
      ],
    );
  }

  // Widget hiển thị từng thành viên (thay cho Card/ListTile cũ)
  Widget _buildMemberRow(String name, String id) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          'MSSV: $id',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}