# 🏕️ WILDAN APP - Sổ Tay Sinh Tồn Toàn Diện
> **Nhánh hiện tại:** `Duc_Anh_Branch` | **Bản cập nhật:** Hoàn thiện giao diện `AboutScreen`

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed_About_Screen-success?style=for-the-badge)

## 📝 BÁO CÁO TIẾN ĐỘ NGÀY 6/5/2026 (Yêu cầu bài giữa kỳ)
**Người thực hiện:** Nguyễn Lê Đức Anh (MSSV: 23010246)
**Mục tiêu hoàn thành:** Xây dựng, fix lỗi môi trường và chuẩn hóa thiết kế trang Giới thiệu (`lib/screens/about_screen.dart`) bám sát bản vẽ Figma.

### 🌟 Chi tiết các tính năng đã phát triển trên `AboutScreen`:

Trong phiên bản cập nhật hôm nay, trang **About** đã được "lột xác" hoàn toàn từ một danh sách thô thành một trang tổng quan chuyên nghiệp, bao gồm các thành phần chính:

**1. Wilderness Banner (Header ảnh bìa):**
* Tích hợp hình ảnh rừng núi hoang dã làm background cho Header.
* Sử dụng lớp phủ màu (`opacity: 0.6` kết hợp `Colors.green.shade900`) để làm nổi bật tiêu đề "SINH TỒN CÚC PHƯƠNG" cùng icon phong cảnh (`Icons.landscape`), mang lại cảm giác nhập vai ngay khi mở app.

**2. Khung Tuyên ngôn Dự án (Core Philosophy):**
* Nhấn mạnh tiêu chí **"Phi trò chơi" (Non-gamification)** – không thanh sinh lực, kiến thức chuẩn thực tế.
* Được thiết kế nổi bật trong một `Container` bo góc nền xanh nhạt, viền xanh lá, giúp Giảng viên chấm điểm dễ dàng nhận diện định hướng nghiêm túc của đồ án.

**3. Tóm tắt Cẩm nang Toàn thư (Feature Summary):**
* Thay vì liệt kê dài dòng các loài vật/cây cối, trang About nay đóng vai trò là "Bản đồ tính năng" (Overview).
* Xây dựng custom widget `_buildFeatureSummary` để đồng bộ UI:
  * 🐾 **Động vật hoang dã:** Màu Đỏ (Cảnh báo nguy hiểm).
  * 🍃 **Thực vật bản địa:** Màu Xanh lá (Sự sống/Sinh tồn).
  * 🔥 **Kỹ năng sinh tồn:** Màu Cam (Lửa/Hành động).
  * 🛠️ **Dụng cụ & Trang bị:** Màu Xanh dương (Công cụ/Logic).

**4. Giao diện Danh sách Thành viên (Team Roster):**
* Cải tiến từ giao diện text thường thành các thẻ `Card` phẳng (flat design) với viền xám tinh tế.
* Tích hợp `CircleAvatar` hiển thị icon user và dấu tick xanh (`Icons.check_circle`) xác nhận thông tin MSSV chuẩn của ĐH Phenikaa.

### 🛠️ Các vấn đề kỹ thuật đã xử lý (Troubleshooting):
* **Cấu hình môi trường Codespaces:** Khắc phục lỗi `flutter: command not found` bằng cách Clone trực tiếp Flutter SDK bản Stable và thiết lập biến môi trường `$PATH`.
* **Tối ưu tốc độ Build Web:** Chuyển đổi lệnh chạy sang `flutter run -d web-server --web-renderer html --web-port 8080`, khắc phục triệt để tình trạng treo/mở web quá lâu trên server của GitHub.
* **Fix Bug Architecture:** Sửa các lỗi sai đường dẫn thư mục, sửa class `AboutPage` thành `AboutScreen`, bổ sung từ khóa `const` và `import 'package:flutter/material.dart';` để tích hợp trơn tru vào `BottomNavigationBar` của `main_layout.dart`.

---

## 👥 Đội ngũ Phát triển (Wildan Team)
Dự án được thực hiện bởi nhóm sinh viên **Đại học Công nghệ Thông tin Phenikaa** (Nhóm Chiến Anh Tú 3).

| Họ và Tên | Mã sinh viên | Vai trò đảm nhận |
| :--- | :---: | :--- |
| **Tạ Công Chiến** | `23010209` | Quản lý dự án (PM) & Lập trình viên |
| **Nguyễn Văn Tú** | `23010109` | Thiết kế UI/UX, Lập trình Frontend & Viết báo cáo |
| **Nguyễn Lê Đức Anh** | `23010246` | Đảm bảo chất lượng (QA), Khởi tạo Môi trường & Backend |

---

## 💻 Kiến trúc & Công nghệ (Tech Stack)
* **Frontend:** Flutter (Dart)
* **Môi trường Dev:** GitHub Codespaces (Cloud Development)
* **Local DB:** SQLite (Lưu trữ cẩm nang Offline)
* **Cloud Services:** Firebase Authentication, Cloud Firestore
* **Tools:** Figma (Prototyping & Mockup)

---
*© 2026 Nhóm Chiến Anh Tú 3 - Phenikaa University. Đồ án được phát triển cho mục đích học tập.*
