// File: lib/ListWildlife.dart
import 'Wildlife.dart';

class ListWildlife {
  List<Wildlife> collection = [];

  // 1. CREATE (Tạo mới)
  void addWildlife(Wildlife animal) {
    collection.add(animal);
    print('✅ [CREATE] Đã thêm: ${animal.name}');
  }

  // 2. READ (Đọc toàn bộ)
  List<Wildlife> readAll() {
    print('\n📖 [READ] Đang tải danh sách... Tổng số: ${collection.length}');
    for (var animal in collection) {
      animal.printDetails();
      print('---------------------------');
    }
    return collection;
  }

  // 3. EDIT (Cập nhật - Sử dụng tham số có tên named parameters để code gọn gàng)
  void editWildlife({
    required int id,
    required String newName,
    required String newSpecies,
    required String newHabitat,
    required String newDangerLevel,
    required bool newIsPoisonous,
    required String newBehavior,
    required String newFirstAidTip,
  }) {
    int index = collection.indexWhere((animal) => animal.id == id);
    if (index != -1) {
      collection[index].name = newName;
      collection[index].species = newSpecies;
      collection[index].habitat = newHabitat;
      collection[index].dangerLevel = newDangerLevel;
      collection[index].isPoisonous = newIsPoisonous;
      collection[index].behavior = newBehavior;
      collection[index].firstAidTip = newFirstAidTip;
      print('✏️ [EDIT] Đã cập nhật thành công động vật ID: $id');
    } else {
      print('❌ [LỖI] Không tìm thấy ID: $id');
    }
  }

  // 4. DELETE (Xóa)
  void deleteWildlife(int id) {
    collection.removeWhere((animal) => animal.id == id);
    print('🗑️ [DELETE] Đã xóa động vật ID: $id');
  }
}