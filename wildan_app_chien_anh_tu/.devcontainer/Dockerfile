# Sử dụng image Ubuntu mặc định tối ưu cho Dev Containers
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Cài đặt các công cụ cơ bản cần thiết cho Flutter
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa

# Chuyển sang tài khoản mặc định 'vscode' thay vì dùng quyền root (để tránh lỗi phân quyền)
USER vscode
WORKDIR /home/vscode

# Tải Flutter SDK bản Stable mới nhất
RUN git clone https://github.com/flutter/flutter.git -b stable

# Thêm biến môi trường để hệ thống nhận diện lệnh 'flutter'
ENV PATH="$PATH:/home/vscode/flutter/bin"

# Bật cấu hình hỗ trợ chạy Flutter trên nền tảng Web
RUN flutter config --enable-web