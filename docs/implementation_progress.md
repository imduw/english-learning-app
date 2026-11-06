# Tiến độ triển khai

Cập nhật: 2026-11-06.

## Tổng quan

- Frame cấp cao nhất phát hiện từ metadata `0:1`: **83**.
- Đã có UI cho **15/83** frame, gồm 7 frame mới trong yêu cầu lần này; trang truyện hiện có một phần và còn placeholder.
- Widget test: **5 test đạt**, gồm luồng ôn từ, reflow, quiz ảnh, điều hướng TOEIC tới kết quả bài thi và trang khóa học của tôi.
- Hoàn tất sau đối chiếu thiết kế: **0**; chưa frame nào được Verified, chưa chạy screenshot comparison từng màn.
- Asset đã nhập: **10 asset MCP cũ + 7 ảnh nguồn mới duy nhất**; chưa có file audio hoặc font binary.
- Điều hướng cục bộ gồm tuyến lộ trình/quiz và tuyến khám phá → danh mục → cấp độ → bài học → bài thi → kết quả; các nối giữa frame TOEIC dựa trên ảnh/tên frame, chưa xác minh prototype link.
- Trang khởi động là Khám phá khóa học (`/`). Tab Học tập mở lộ trình (`/learning/path`). Trên web, khung dọc giữ tỉ lệ/kích thước thiết kế 436×876 hoặc 360×800, lộ trình ngang giữ 800×360 và thu đồng đều để vừa viewport.
- Chạy web-server tại `http://127.0.0.1:5173/`; screenshot xác nhận màn lộ trình và asset SVG hiển thị. Windows desktop chưa chạy được do thiếu Visual Studio C++ toolchain.
- Dependency thêm: `flutter_svg`.

## Trạng thái

`docs/figma_inventory.md` lưu cấu trúc; `docs/frame_status_matrix.md` là checklist theo từng frame. Hiện có 15 frame In Progress, 66 frame UI Pending, một frame `1:5397` chưa rõ chức năng và design system `1:5399` đã đọc token. Không có frame nào Completed/Verified. Các luồng đã có test nhưng chưa so sánh screenshot từng màn.

## Chặn tiến độ Figma

Figma MCP trả thông báo đã chạm giới hạn gọi công cụ gói Starter trong lúc truy vấn metadata các frame đại diện. `whoami` xác nhận gói hiện tại là Starter. Không có lỗi quyền truy cập được trả về; đây là quota/rate limit. Chưa thể lấy preview/style riêng cho các frame còn lại. Cần tăng quota hoặc chờ giới hạn được làm mới, sau đó xử lý batch 3–5 frame, cập nhật inventory và kiểm tra từng batch.

## Lệnh kiểm tra đã chạy

- `flutter pub get` — thành công.
- `flutter test test/widget_test.dart` — thành công, 5 test sau khi thêm nhóm khóa học/đánh giá.
- `flutter analyze` — `No issues found!`.
- `flutter build web` — thành công, đầu ra tại `build/web`.
- DTD runtime diagnostics sau hot reload — không có runtime errors. Flutter Driver screenshot không dùng được vì app chưa bật driver extension; browser screenshot xác nhận màn Khám phá được căn giữa trong cửa sổ ngang và lộ trình dùng canvas landscape riêng.

## Tiếp theo

1. Sau khi Figma quota cho phép: lấy context/preview các frame theo batch 3–5, xác minh prototype của tuyến quiz và các màn tiếp theo.
2. Thay minh họa truyện tạm bằng asset gốc đúng frame; tiếp tục kiểm tra mismatch layer ảnh `1:191`.
3. Bổ sung kiểm thử riêng cho các frame và luồng thực tế; đối chiếu screenshot trước khi đặt Verified.
4. Cài Visual Studio workload C++ desktop nếu cần chạy Windows native; web preview có thể chạy bằng `flutter run -d web-server --web-hostname 0.0.0.0 --web-port 5173`.
