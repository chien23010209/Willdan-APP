// File: lib/Wildlife.dart

class Wildlife {
  // --- MIÊU TẢ CÁC BIẾN (MỞ RỘNG) ---
  int id;
  String name;           // Tên gọi (VD: Rắn lục đuôi đỏ, Gấu chó)
  String species;        // Nhóm loài (VD: Bò sát, Thú lớn, Côn trùng)
  String habitat;        // Nơi trú ẩn/Môi trường sống (VD: Bụi rậm, Cây cao)
  String dangerLevel;    // Mức độ nguy hiểm (Thấp, Trung Bình, Cao, Cực cao)
  bool isPoisonous;      // Có độc hay không
  String behavior;       // Tập tính (VD: Kiếm ăn ban đêm, Bầy đàn, Hay ngụy trang)
  String firstAidTip;    // Mẹo sơ cứu khi bị cắn/tấn công

  // Constructor
  Wildlife({
    required this.id,
    required this.name,
    required this.species,
    required this.habitat,
    required this.dangerLevel,
    required this.isPoisonous,
    required this.behavior,
    required this.firstAidTip,
  });

  // --- CÁC PHƯƠNG THỨC ---
  String getWarning() {
    return isPoisonous ? '⚠️ CÓ ĐỘC' : '✅ KHÔNG ĐỘC';
  }

  void printDetails() {
    print('ID: $id | $name ($species)');
    print('📍 Nơi sống: $habitat | 🧠 Tập tính: $behavior');
    print('⚡ Nguy hiểm: $dangerLevel - ${getWarning()}');
    print('🏥 Sơ cứu: $firstAidTip');
  }
}