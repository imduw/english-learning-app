# Design system

Nguồn chính: metadata Figma node `1:5399` (“Bảng màu & kiểu chữ”), nội dung style đọc được ở các frame `1:18`, `1:110`, `1:162`. Không bổ sung token không có dữ liệu.

## Màu

| Token | Giá trị | Vai trò ghi trong Figma |
|---|---|---|
| Chủ đạo | `#29B6F6` | Nút học, biểu tượng và tiến trình |
| Nhấn mạnh | `#2563EB` | Liên kết, mục đang chọn và điểm nhấn |
| Nền dịu | `#D7ECFD` | Nền bài học và vùng nội dung phụ |
| Hành động | `#FF9500` | Nút bắt đầu, tiếp tục hoặc mở khóa |
| Tích cực | `#84CC16` | Hoàn thành và phản hồi đúng |
| Bề mặt | `#FFFFFF` | Thẻ bài học và bề mặt nội dung |
| Nội dung | `#1F2937` | Tiêu đề, nội dung, nhãn |

Các màu phụ thấy trong style của frame: nền `#EAF4FD`, xanh tiến độ `#29B6F6`, viền ảnh `#7DD3FC`, thẻ từ `#E2F3FE`, viền thẻ `#A3DCFF`, chữ phụ `#95A5B5`/`#A5C5DC`.

## Chữ

- Họ chữ: **Noto Serif**.
- Trọng lượng được design system nêu: Regular 400, Medium 500, SemiBold 600, Bold 700.
- Kích thước đọc được ở các frame: 28 px tiêu đề “Từ vựng hôm nay”, 24 px “Day 1”, 20 px từ vựng/tiêu đề bài, 14 px nhãn giai đoạn, 12 px bộ đếm và phụ đề, 11 px nhãn trạng thái “Đã thuộc rồi”.
- Figma ghi mẫu chữ phóng lớn trong bảng font không phải kích thước gốc. Chưa lấy được font binary; Theme đặt family name theo Figma nhưng font chưa được đóng gói nội bộ.

## Hình khối và khoảng cách đã đọc

- Canvas ví dụ landscape: `800×360`; portrait: `360×800`.
- Thẻ mốc học: đường kính 96 px; hình minh họa flashcard 56×64 px.
- Thẻ từ vựng: cao 46 px, bo góc 14 px, padding ngang 21 px.
- Thẻ ảnh ở node `1:162`: 240×190 px, viền xanh nhạt dày 3 px, góc 16 px, ảnh bên trong 218×168 px.
- Header lộ trình có padding 20 px; header câu hỏi ảnh dùng 16 px.
- Bóng và một số radius lấy theo style trả về cho từng frame, không suy rộng sang các frame chưa đọc.

## Flutter

Token màu/theme được đặt tại `lib/core/theme/`. Bố cục reflow theo chiều rộng: màn lộ trình chuyển sang lưới 2×2 trên màn hẹp; không kéo giãn canvas landscape thành portrait. Font binary, input styles và các component chưa có bằng chứng đủ thì chưa đánh dấu hoàn tất.