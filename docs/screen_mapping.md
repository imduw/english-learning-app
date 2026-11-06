# Ánh xạ màn hình

Danh sách đủ 83 frame, ID, tên, kích thước, tọa độ, frame con trực tiếp nằm trong [figma_inventory.md](figma_inventory.md). Trạng thái UI/asset/navigation/interaction/test/verification của từng frame được theo dõi trong [frame_status_matrix.md](frame_status_matrix.md). Không gộp các frame có tên gần nhau.

Trang khởi động là frame `1:420` Khám phá khóa học. Tab Học tập dẫn tới `1:18` Lộ trình học. Trên Web, các màn portrait nằm trong canvas theo kích thước export, còn frame lộ trình landscape dùng canvas 800×360; khi viewport nhỏ hơn, canvas thu đồng đều và căn giữa.

Tại lần cập nhật này: 15 frame có UI đang triển khai (In Progress), 66 frame UI pending, 1 frame chưa xác định (`1:5397`), 1 frame design-system đã phân tích token (`1:5399`). Không frame UI nào đã Verified hoặc Completed; chưa có screenshot comparison pixel-by-pixel.

## Đã triển khai trong mã

| Frame | Flutter | Phạm vi |
|---|---|---|
| `1:18` Lộ trình học-Ngày 1 | `lib/features/learning/screens/learning_path_screen.dart` | 4 mốc, bộ đếm sao, asset đường cong; reflow màn hẹp |
| `1:110` Ôn tập từ vựng hôm nay | `lib/features/vocabulary/screens/vocabulary_review_screen.dart` | 5 từ theo mẫu, chọn/bỏ chọn, trạng thái từ đã thuộc |
| `1:162` Học từ vựng qua hình ảnh 1 | `lib/features/vocabulary/screens/vocabulary_image_screen.dart` | tiến trình, điểm, phát âm, ảnh gốc export, nút tiếp |
| `1:2290` Chọn từ theo hình ảnh | `lib/features/vocabulary/screens/vocabulary_image_choice_screen.dart` | ảnh chó gốc, lựa chọn Bee/Dog/Cat, trạng thái đúng/sai, sao và tiếp tục |
| `1:2335` Chọn từ-Đáp án đúng | `lib/features/vocabulary/screens/vocabulary_image_result_screen.dart` | ảnh chó, trạng thái sao, điểm và tiếp tục |
| `1:265` Nghe và chọn hình ảnh đúng | `lib/features/vocabulary/screens/audio_image_choice_screen.dart` | ảnh chó/mèo, chọn ảnh; chưa có audio source |
| `1:222` Kết quả chọn hình ảnh đúng | `lib/features/vocabulary/screens/audio_image_result_screen.dart` | ảnh chó, điểm/sao và tiếp tục |
| `1:2548` Đọc tranh-Trang 1 | `lib/features/stories/screens/picture_story_screen.dart` | văn bản và phân trang; hình minh họa còn là placeholder, nên chưa hoàn tất đối chiếu |
| `1:420` Khám phá khóa học tiếng anh | `lib/features/courses/screens/course_discovery_screen.dart` | tabs Trực tuyến/Của tôi, lưới chủ đề, carousel chuyên đề, chủ đề đặc biệt, bottom navigation |
| `1:801` Danh mục bài học TOEIC | `lib/features/courses/screens/course_category_screen.dart` | lời chào, danh mục và 5 hàng khóa học/kỹ năng |
| `1:905` Danh sách bài học TOEIC | `lib/features/courses/screens/lesson_list_screen.dart` | Bài 1 mở, Bài 2-4 khóa, bottom navigation |
| `1:1002` Danh sách khóa học theo trình độ | `lib/features/courses/screens/course_level_catalog_screen.dart` | hero khóa học, lọc cấp độ và thẻ khóa học |
| `1:1209` Khóa học của tôi | `lib/features/courses/screens/my_courses_screen.dart` | tabs, lọc trạng thái và danh sách khóa học |
| `1:5084` Làm bài kiểm tra cuối bài học | `lib/features/assessments/screens/assessment_screen.dart` | 10 câu dạng hai cột, chọn đáp án, bình luận và Submit |
| `1:4825` Làm bài kiểm tra cuối bài học | `lib/features/assessments/screens/assessment_review_screen.dart` | trạng thái đúng/sai, điểm, bình luận và Hoàn tất |

Các màn trên mới dùng dữ liệu mẫu cục bộ. Chưa có backend hay chức năng âm thanh/ghi âm thực.

## Nhóm còn lại

66 frame UI khác ở trạng thái Pending, một frame `1:5397` chưa thể phân loại. Tên nhóm được giữ từ metadata: khóa học/điều hướng; từ vựng; chính tả/ghép vần; luyện nói/lồng tiếng; sách tranh/truyện; thử thách; bài kiểm tra; cảnh báo/menu. Frame design system `1:5399` đã có token metadata riêng. Chưa gán UI chi tiết cho các frame Pending vì không có design context riêng.

## Giới hạn

- `get_design_context` đọc được các frame mẫu đã có trong lịch sử MCP, nhưng lượt hiện tại đạt giới hạn Starter khi lấy thêm metadata `1:2383`; các frame chưa có preview không được triển khai theo phỏng đoán.
- Metadata cấp page có thể cung cấp cây node, nhưng không thay cho đọc styles/preview riêng của từng frame.
- “Implemented” không đồng nghĩa “Completed”; chưa có đối chiếu screenshot cho các frame Flutter.