// lib/ListSurvivalKit.dart
import 'SurvivalKit.dart';

class ListSurvivalKit {
  // Biến danh sách chứa các đối tượng SurvivalKit
  List<SurvivalKit> kits = [];

  // 1. CREATE: Tạo mới và thêm vào danh sách
  void createKit(int id, String name, String function, int quantity) {
    SurvivalKit newKit = SurvivalKit(
      id: id,
      name: name,
      function: function,
      quantity: quantity,
    );
    kits.add(newKit);
    print("Đã thêm dụng cụ: $name");
  }

  // 2. READ: Đọc tất cả bản ghi
  void readAllKits() {
    if (kits.isEmpty) {
      print("Danh sách dụng cụ trống.");
    } else {
      print("--- DANH SÁCH DỤNG CỤ SINH TỒN ---");
      for (var kit in kits) {
        print("ID: ${kit.id} | Tên: ${kit.name} | SL: ${kit.quantity}");
      }
    }
  }

  // 3. EDIT: Sửa bản ghi theo ID cụ thể
  void editKit(int id, String newName, int newQuantity) {
    for (var kit in kits) {
      if (kit.id == id) {
        kit.name = newName;
        kit.quantity = newQuantity;
        print("Đã cập nhật dụng cụ ID $id thành công.");
        return;
      }
    }
    print("Không tìm thấy dụng cụ với ID: $id");
  }

  // (Bổ sung thêm Delete nếu bạn cần)
  void deleteKit(int id) {
    kits.removeWhere((kit) => kit.id == id);
    print("Đã xóa dụng cụ ID $id.");
  }
}