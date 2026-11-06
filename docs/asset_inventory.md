# Kiểm kê asset

Asset tải bằng URL export do Figma MCP trả về trước khi gói Starter chạm giới hạn. Tất cả file đang dùng là local; không để URL tạm trong runtime.

| Node Figma | Tên/layer trong dữ liệu | File Flutter | Loại / tình trạng |
|---|---|---|---|
| `1:22` | SVG của nút quay lại trong lộ trình | `assets/icons/back.svg` | SVG tải và parse hợp lệ |
| `1:29` | SVG Star Icon | `assets/icons/star.svg` | SVG tải và parse hợp lệ |
| `1:37` / `1:38` | Đường học cong và vector | `assets/illustrations/learning_path.svg` | SVG tải và parse hợp lệ |
| `1:54` | Icon nhỏ trong thông tin giai đoạn | `assets/icons/progress.svg` | SVG tải và parse hợp lệ; đang dùng trong theme danh mục |
| `1:62` | SVG Pencil icon | `assets/icons/pencil.svg` | SVG tải và parse hợp lệ |
| `1:80` | SVG micro | `assets/icons/microphone.svg` | SVG tải và parse hợp lệ |
| `1:97` | SVG sách mở | `assets/icons/storybook.svg` | SVG tải và parse hợp lệ |
| `1:183` | SVG nút câu tiếp theo | `assets/icons/next.svg` | SVG tải và parse hợp lệ |
| `1:188` | SVG nghe phát âm | `assets/icons/listen.svg` | SVG tải và parse hợp lệ |
| `1:191` | Layer tên “Two horses in an open green pasture under a sunny sky with clouds” | `assets/images/vocabulary/horses_in_pasture.jpg` | Export MCP cũ; layer và preview không khớp. Không còn dùng trong màn quiz từ vựng, giữ nguyên file cũ để không xóa dữ liệu. |
| Chưa có node ID được xác minh | Chó con ngậm hoa tím (`Downloads/images/Background.png`) | `assets/images/vocabulary/dog_flower.png` | 700×933 PNG; nội dung khớp ảnh chó trong các ảnh tham chiếu frame `1:162`, `1:2290`, `1:2335`, `1:265`, `1:222`. Đang dùng trong tuyến quiz. |
| Chưa có node ID được xác minh | Mèo con trong phòng (`Cảnh khu phố ngập tràn ánh nắng bình minh rực rỡ.png`) | `assets/images/vocabulary/kitten_in_room.png` | 335×597 PNG; dùng làm lựa chọn mèo trong màn nghe/chọn. File `_1.png` có SHA-256 giống hệt nên không nhân đôi. |
| Chưa gắn | Giáo viên tiếng Anh (ảnh ngang) | `assets/images/speaking/english_teacher.png` | 512×229 PNG; ứng viên cho màn video/phát âm, chưa gắn vì chưa xác minh node đích. |
| Chưa gắn | Poster “Johny Johny Yes Papa” | `assets/images/stories/johny_johny_cover.png` | 1280×720 PNG; ứng viên nội dung nghe/truyện; khác bìa “Love is an open door” trong ảnh frame nên chưa gắn. |
| Chưa gắn | Poster minh họa nguyên âm tiếng Anh | `assets/images/phonics/vowel_illustration.png` | 800×500 PNG; ứng viên cho nội dung ngữ âm, cần xác nhận vị trí/frame trước khi dùng. |
| `1:4825`, `1:5084` | Banner STUDY4 lộ trình TOEIC | `assets/images/courses/study4_toeic_banner.png` | 2250×1264 PNG; dùng ở header hai trạng thái bài thi với `BoxFit.cover`. |
| `1:4825`, `1:5084`, `1:1002` | Hình minh họa TOEIC 450 | `assets/images/courses/toeic_450_art.png` | 1200×900 PNG; dùng làm thumbnail khóa học/bài thi, giữ tỉ lệ trong khung. |
| `1:2566` | Minh họa mèo và chim trên cành | Chưa có | Không xuất được trong lượt hiện tại vì quota MCP; màn truyện hiện dùng placeholder tạm và chưa hoàn tất. |
| `1:5444` (mẫu typography) | Noto Serif | Chưa có file font | Tên font/weights có trong node `1:5399`; binary chưa tải được. Flutter theme đặt tên family, chưa nhúng font. |

`pubspec.yaml` khai báo icons, illustrations và từng thư mục con images. Đã nhập 7 ảnh nguồn mới duy nhất; hai file mèo trùng byte nên chỉ lưu một bản. Cùng với 10 asset MCP trước đó, project có 17 asset đã nhập. Chưa có font binary hoặc file audio. Các ảnh ứng viên chưa được gắn vào UI để tránh dùng sai màn.