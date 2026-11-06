# Ma trận trạng thái 83 frame

Nguồn ID/tên/kích thước/vị trí/frame con: [figma_inventory.md](figma_inventory.md), parse metadata page `0:1`. MCP hiện giới hạn các lần đọc bổ sung; do đó không đánh đồng metadata với preview/style đầy đủ.

Quy ước: `IP` = In Progress; `P` = Pending; `B` = Blocked bởi quota MCP; `N/A` = không áp dụng; `No` = chưa đối chiếu Figma. Chỉ ghi `Verified` sau khi có screenshot Flutter so với Figma; hiện chưa frame UI nào đạt trạng thái đó.

| # | Frame ID / tên | UI | Asset | Navigation | Interaction | Test | Verification |
|---:|---|---|---|---|---|---|---|
| 1 | `1:18` Lộ trình học-Ngày 1 | IP | Partial | Demo | Partial | Pass (luồng) | No |
| 2 | `1:110` Ôn tập từ vựng hôm nay | IP | Partial | Demo | Partial | Pass (chọn/luồng) | No |
| 3 | `1:162` Học từ vựng qua hình ảnh 1 | IP | Đã dùng ảnh chó nguồn mới | Demo | Audio chưa có file | Pass (luồng) | No |
| 4 | `1:192` Học từ vựng qua hình ảnh 3 | P | B | P | P | P | No |
| 5 | `1:222` Kết quả chọn hình ảnh đúng | IP | Ảnh chó nguồn mới | Demo | Trạng thái đúng + tiếp | Pass (luồng) | No |
| 6 | `1:265` Nghe và chọn hình ảnh đúng | IP | Ảnh chó + mèo nguồn mới | Demo | Chọn ảnh; audio thiếu file | Pass (luồng) | No |
| 7 | `1:294` Học từ vựng qua hình ảnh 2 | P | B | P | P | P | No |
| 8 | `1:324` Video hướng dẫn phát âm | P | B | P | P | P | No |
| 9 | `1:328` Thử thách-Trả lời sai | P | B | P | P | P | No |
| 10 | `1:420` Khám phá khóa học tiếng anh | IP | Component icons/cards | Có route tới danh mục/mine | Tabs/chủ đề | Pass | No |
| 11 | `1:801` Danh mục bài học TOEIC | IP | Text/icon UI | Route tới cấp độ | Vào học | Pass | No |
| 12 | `1:905` Danh sách bài học TOEIC | IP | Text/icon UI | Route tới bài thi | Bài 1 mở, bài 2-4 khóa | Pass | No |
| 13 | `1:1002` Danh sách khóa học theo trình độ | IP | Artwork TOEIC nguồn user | Route tới bài học | Tabs lọc cấp độ | Pass | No |
| 14 | `1:1209` Khóa học của tôi | IP | Component illustrations | Route tới danh mục | Tabs lọc khóa học | Pass | No |
| 15 | `1:1383` Lộ trình học tiếng anh thiếu nhi | P | B | P | P | P | No |
| 16 | `1:1518` Lộ trình học-Danh mục kỹ năng | P | B | P | P | P | No |
| 17 | `1:1697` Chọn cấp độ học tập | P | B | P | P | P | No |
| 18 | `1:1864` Aleart_learn_start | P | B | P | P | P | No |
| 19 | `1:1889` Ghép chữ theo hình ảnh | P | B | P | P | P | No |
| 20 | `1:1927` Học chính tả-Ghép chữ | P | B | P | P | P | No |
| 21 | `1:1964` Ghép chữ-Đáp án đúng | P | B | P | P | P | No |
| 22 | `1:2010` Bắt đầu học tù vựng | P | B | P | P | P | No |
| 23 | `1:2047` Chuyển sang học chính tả | P | B | P | P | P | No |
| 24 | `1:2084` Đọc truyện | P | B | P | P | P | No |
| 25 | `1:2119` Luyện nói-Bắt đầu | P | B | P | P | P | No |
| 26 | `1:2155` Hoàn thành bài học từ vựng | P | B | P | P | P | No |
| 27 | `1:2200` Hoàn thành bài học chính tả | P | B | P | P | P | No |
| 28 | `1:2245` Hoàn thành bài luyện nói | P | B | P | P | P | No |
| 29 | `1:2290` Chọn từ theo hình ảnh | IP | Ảnh chó nguồn mới | Demo | Chọn từ, đúng/sai | Pass (luồng) | No |
| 30 | `1:2335` Chọn từ-Đáp án đúng | IP | Ảnh chó nguồn mới | Demo | Sao + tiếp | Pass (luồng) | No |
| 31 | `1:2383` Luyện nói-Phát âm từ vựng | P | B | P | P | P | No |
| 32 | `1:2425` Luyện nói đang ghi âm | P | B | P | P | P | No |
| 33 | `1:2467` Luyện nói-Phát âm chính xác | P | B | P | P | P | No |
| 34 | `1:2516` Đọc sách tranh-Giới thiệu tranh | P | B | P | P | P | No |
| 35 | `1:2548` Đọc tranh-Trang 1 | IP | Missing original; placeholder | Demo | Partial, pagination | Pass (luồng) | No |
| 36 | `1:2591` Đọc tranh-Trang 2 | P | B | P | P | P | No |
| 37 | `1:2628` Sách tranh-Nghe và chọn âm thanh | P | B | P | P | P | No |
| 38 | `1:2668` Sách tranh-Chọn âm thanh đúng | P | B | P | P | P | No |
| 39 | `1:2718` Sách tranh-Điền từ vào câu | P | B | P | P | P | No |
| 40 | `1:2755` Sách tranh-Điền từ đúng | P | B | P | P | P | No |
| 41 | `1:2806` Sách tranh-Nghe và nhận diện từ | P | B | P | P | P | No |
| 42 | `1:2839` Sách tranh-Nhận diện từ đúng | P | B | P | P | P | No |
| 43 | `1:2881` Hoàn thành bài học | P | B | P | P | P | No |
| 44 | `1:2930` Hoàn thành bài học | P | B | P | P | P | No |
| 45 | `1:2971` Lồng tiếng-Bắt đầu | P | B | P | P | P | No |
| 46 | `1:2997` Lồng tiếng-Đang ghi âm | P | B | P | P | P | No |
| 47 | `1:3023` Lồng tiếng-Kết quả phát âm | P | B | P | P | P | No |
| 48 | `1:3057` Sách tranh-Giải thích cấp độ | P | B | P | P | P | No |
| 49 | `1:3142` Sách tranh-Thư viện truyện | P | B | P | P | P | No |
| 50 | `1:3265` Menu thả xuống vị trí nổi đè lên nội dung sách phía sau | P | B | P | P | P | No |
| 51 | `1:3287` Sách tranh-Chọn chế độ học | P | B | P | P | P | No |
| 52 | `1:3321` Đọc sách tranh-Trang 1 | P | B | P | P | P | No |
| 53 | `1:3354` Đọc sách tranh-Trang 2 | P | B | P | P | P | No |
| 54 | `1:3383` Hoàn thành đọc sách tranh | P | B | P | P | P | No |
| 55 | `1:3430` Aleart_Read_Book | P | B | P | P | P | No |
| 56 | `1:3444` Aleart_Learn_NA | P | B | P | P | P | No |
| 57 | `1:3458` Aleart_Learn_Vocabulary | P | B | P | P | P | No |
| 58 | `1:3472` Ngữ âm-Danh sách bài đọc | P | B | P | P | P | No |
| 59 | `1:3599` Ngữ âm-Lộ trình học | P | B | P | P | P | No |
| 60 | `1:3696` Ngữ âm-Giới thiệu chương trình | P | B | P | P | P | No |
| 61 | `1:3869` Ghép vần-Phần 1: Bắt đầu | P | B | P | P | P | No |
| 62 | `1:3895` Ghép vần-Học nguyên âm | P | B | P | P | P | No |
| 63 | `1:3977` Ghép vần-Nghe và chọn âm | P | B | P | P | P | No |
| 64 | `1:4010` Ghép vần-Chọn âm đúng | P | B | P | P | P | No |
| 65 | `1:4052` Ghép vần-Luyện nghe âm | P | B | P | P | P | No |
| 66 | `1:4089` Ghép vần-Kết quả luyện nghe | P | B | P | P | P | No |
| 67 | `1:4135` Ghép vần-Phần 2:Bắt đầu | P | B | P | P | P | No |
| 68 | `1:4166` Ghép vần-Phần 3: Bắt đầu | P | B | P | P | P | No |
| 69 | `1:4194` Ghép vần-Nghe và chọn từ | P | B | P | P | P | No |
| 70 | `1:4215` Ghép vần-Chọn từ đúng | P | B | P | P | P | No |
| 71 | `1:4250` Hoàn thành bài học ngữ âm | P | B | P | P | P | No |
| 72 | `1:4297` Thử thách từ vựng-Bắt đầu | P | B | P | P | P | No |
| 73 | `1:4400` Thử thách từ vựng-Chọn nghĩa | P | B | P | P | P | No |
| 74 | `1:4492` Thử thách-Hoàn thành | P | B | P | P | P | No |
| 75 | `1:4549` Thử thách-Trả lời đúng | P | B | P | P | P | No |
| 76 | `1:4644` Nghe truyện tiếng anh-Trình phát | P | B | P | P | P | No |
| 77 | `1:4731` Danh sách album truyện tiếng anh | P | B | P | P | P | No |
| 78 | `1:4825` Làm bài kiểm tra cuối bài học | IP | Study4 banner + TOEIC art | Kết quả sau nộp | Dấu đúng/sai, góp ý | Pass | No |
| 79 | `1:5084` Làm bài kiểm tra cuối bài học | IP | Study4 banner + TOEIC art | Tới kết quả `1:4825` | Chọn đáp án, comment, submit | Pass | No |
| 80 | `1:5353` Thông báo vượt qua | P | B | P | P | P | No |
| 81 | `1:5364` Hoàn thành bài lồng tiếng | P | B | P | P | P | No |
| 82 | `1:5397` Học | Chưa xác định | B | P | P | P | No |
| 83 | `1:5399` Bảng màu & kiểu chữ | Analyzed (tokens) | N/A | N/A | N/A | N/A | No |

## Đếm trạng thái

- Có một phần UI đang triển khai cho **15 frame** (`1:18`, `1:110`, `1:162`, `1:222`, `1:2290`, `1:2335`, `1:265`, `1:2548`, `1:420`, `1:801`, `1:905`, `1:1002`, `1:1209`, `1:4825`, `1:5084`); chưa frame nào Verified/Completed.
- **66 frame UI** còn pending do chưa có triển khai, cộng **1 frame chưa xác định chức năng** (`1:5397`).
- `1:5399` là frame design system, đã phân tích token bằng metadata nhưng chưa dựng thành màn UI riêng.
- 15 frame đã có UI/demo nhưng còn hạng mục thiếu hoặc chưa đối chiếu; không tính là hoàn thành 83/83.
