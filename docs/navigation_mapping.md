# Ánh xạ điều hướng

Các route hiện tại nằm trong `lib/app/app.dart`. App khởi động ở `/` (Khám phá khóa học); tab Học tập mở `/learning/path`.

| Nguồn | Thao tác | Đích app | Căn cứ / độ chắc chắn |
|---|---|---|---|
| `1:18` | Chạm mốc “Học từ vựng” | `/vocabulary/review` (`1:110`) | Tên mốc và màn ôn từ khớp; route local demo, Figma metadata không cung cấp prototype link |
| `1:110` | Nút mũi tên tiếp | `/vocabulary/image` (`1:162`) | Nút tiếp hiện hữu trong node tree; đích là luồng demo cục bộ, chưa xác minh interaction link trong Figma |
| `1:162` | Nút mũi tên tiếp | `/vocabulary/image/choose-word` (`1:2290`) | Nối theo chuỗi bài tập/tên frame; prototype link chưa xác minh |
| `1:2290` | Chọn đáp án Dog rồi tiếp | `/vocabulary/image/answer` (`1:2335`) | Trạng thái đúng tiếp theo theo tên frame; đích demo |
| `1:2335` | Nút mũi tên tiếp | `/vocabulary/audio/choose-image` (`1:265`) | Nối theo tên frame nghe/chọn; prototype link chưa xác minh |
| `1:265` | Chọn ảnh chó rồi tiếp | `/vocabulary/audio/answer` (`1:222`) | Trạng thái kết quả đúng tiếp theo theo tên frame; đích demo |
| `1:222` | Nút mũi tên tiếp | `/stories/picture-book` (`1:2548`) | Nối demo để kiểm tra tuyến; prototype link chưa xác minh |
| `1:420` | Chạm chủ đề TOEIC / tab Của tôi | `/courses/category` (`1:801`) / `/courses/mine` (`1:1209`) | Tên frame và thao tác trong ảnh tham chiếu; chưa có prototype link |
| `1:801` | Vào học ở khóa TOEIC | `/courses/levels` (`1:1002`) | Nối theo module TOEIC; chưa xác minh prototype |
| `1:1002` | Vào học ở thẻ cấp độ | `/courses/lessons` (`1:905`) | Nối theo chuỗi màn khóa học; chưa xác minh prototype |
| `1:905` | Vào học ở Bài 1 | `/assessment` (`1:5084`) | Mở bài thi trong app demo; bài 2-4 vẫn khóa như ảnh |
| `1:5084` | Submit | `/assessment/review` (`1:4825`) | Chuyển từ đáp án đang chọn sang trạng thái đúng/sai cục bộ |
| `1:4825` | Hoàn tất | `/courses/category` (`1:801`) | Quay về danh mục khóa học |
| Bottom navigation `Của tôi` | Chọn tab | `/courses/mine` (`1:1209`) | Chuyển tới danh sách khóa học của người dùng |
| Các màn con | Nút quay lại | Pop route hiện tại | Có nút quay lại trong các frame và hành vi điều hướng thông thường; cần xác minh prototype khi lấy được MCP context |
| `1:2548` | Trang trước/sau | Trang 1/2 tại chỗ | Metadata có các nút pagination và chỉ báo `1 / 2`; nội dung trang 2 là dữ liệu cục bộ tạm |

Mọi điều hướng liên màn ngoài back stack hiện được mô phỏng tại client; chưa tích hợp API, audio playback hoặc microphone. Route map cần cập nhật sau khi đọc được prototype/link thực từ Figma.