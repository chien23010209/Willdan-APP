// lib/SurvivalKit.dart

class SurvivalKit {
  int id;
  String name; // Tên dụng cụ (Ví dụ: Dao, Đèn pin)
  String function; // Công dụng
  int quantity; // Số lượng

  // Constructor (Hàm khởi tạo)
  SurvivalKit({
    required this.id,
    required this.name,
    required this.function,
    required this.quantity,
  });

  // Phương thức miêu tả hoạt động của đối tượng
  void use() {
    print("Sử dụng $name để $function.");
  }

  // Phương thức kiểm tra tình trạng số lượng
  bool isAvailable() {
    return quantity > 0;
  }
}