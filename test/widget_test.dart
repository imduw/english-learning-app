// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:english_learning_app/app/app.dart';

void main() {
  testWidgets('khởi động ở khám phá và tab học tập mở lộ trình', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1000, 700);
    tester.view.devicePixelRatio = 1;
    await tester.pumpWidget(const EnglishLearningApp());
    expect(find.text('Trực tuyến'), findsOneWidget);
    expect(find.text('Từ vựng hôm nay:'), findsNothing);
    await tester.tap(find.text('Học tập'));
    await tester.pumpAndSettle();
    expect(find.text('Day 1'), findsOneWidget);
    await tester.tap(find.text('Học từ vựng'));
    await tester.pumpAndSettle();
    expect(find.text('Từ vựng hôm nay:'), findsOneWidget);
    expect(find.text('morning'), findsOneWidget);
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });

  testWidgets('lộ trình reflow ở chiều rộng hẹp', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(680, 800);
    tester.view.devicePixelRatio = 1;
    await tester.pumpWidget(const EnglishLearningApp());
    await tester.tap(find.text('Học tập'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.text('Học từ vựng'), findsOneWidget);
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });

  testWidgets('luồng bài tập ảnh và truyện hoạt động', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1000, 700);
    tester.view.devicePixelRatio = 1;
    await tester.pumpWidget(const EnglishLearningApp());
    await tester.tap(find.text('Học tập'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Học từ vựng'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('morning'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Tiếp tục'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Tiếp tục'));
    await tester.pumpAndSettle();
    expect(find.text('Bee'), findsOneWidget);
    expect(find.text('Dog'), findsOneWidget);
    expect(find.text('Cat'), findsOneWidget);
    await tester.tap(find.text('Dog'));
    await tester.pumpAndSettle();
    expect(find.byTooltip('Tiếp tục'), findsWidgets);
    await tester.tap(find.byTooltip('Tiếp tục'));
    await tester.pumpAndSettle();
    expect(find.byType(Image), findsOneWidget);
    await tester.tap(find.byTooltip('Tiếp tục'));
    await tester.pumpAndSettle();
    expect(find.bySemanticsLabel('Chọn hình con chó'), findsOneWidget);
    expect(find.bySemanticsLabel('Chọn hình con mèo'), findsOneWidget);
    await tester.tap(find.bySemanticsLabel('Chọn hình con chó'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Tiếp tục'));
    await tester.pumpAndSettle();
    expect(find.byType(Image), findsOneWidget);
    await tester.tap(find.byTooltip('Tiếp tục'));
    await tester.pumpAndSettle();
    expect(find.text('Đọc sách tranh'), findsOneWidget);
    expect(find.text('1 / 2'), findsOneWidget);
    await tester.tap(find.byTooltip('Trang sau'));
    await tester.pumpAndSettle();
    expect(find.text('2 / 2'), findsOneWidget);
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });

  testWidgets('các frame khóa học TOEIC và bài thi có điều hướng', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(436, 876);
    tester.view.devicePixelRatio = 1;
    await tester.pumpWidget(const EnglishLearningApp());

    expect(find.text('Trực tuyến'), findsOneWidget);
    await tester.tap(find.text('TOEIC').first);
    await tester.pumpAndSettle();
    expect(find.text('Khóa học toeic 0 - 450'), findsOneWidget);

    await tester.tap(find.text('Vào học').first);
    await tester.pumpAndSettle();
    expect(find.text('0 - 450'), findsOneWidget);
    await tester.tap(find.text('Vào học').first);
    await tester.pumpAndSettle();
    expect(find.text('Bài 1'), findsOneWidget);
    await tester.tap(find.text('Vào học').first);
    await tester.pumpAndSettle();
    expect(
      find.text(
        'Bài 1: Giới thiệu - Lộ trình tự học toeic 0 - 450 (4 kỹ năng)',
      ),
      findsOneWidget,
    );
    expect(
      tester.takeException(),
      isNull,
      reason: 'màn đang làm bài không được tràn layout',
    );

    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();
    expect(find.text('5 / 10 câu đúng'), findsOneWidget);
    expect(find.text('(Kết quả câu trả lời)'), findsOneWidget);
    expect(
      tester.takeException(),
      isNull,
      reason: 'màn kết quả không được tràn layout',
    );

    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });

  testWidgets('màn khám phá mở danh sách khóa học của tôi', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(436, 876);
    tester.view.devicePixelRatio = 1;
    await tester.pumpWidget(const EnglishLearningApp());
    await tester.tap(find.text('Của tôi'));
    await tester.pumpAndSettle();
    expect(find.text('Tất cả'), findsOneWidget);
    expect(
      find.text('Kế hoạch nâng cao từ vựng THCS (Bản trải nghiệm)'),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });

  testWidgets('chuyển đổi giữa giao diện người lớn và thiếu nhi', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(436, 876);
    tester.view.devicePixelRatio = 1;
    await tester.pumpWidget(const EnglishLearningApp());

    expect(find.text('Trực tuyến'), findsOneWidget);
    await tester.tap(find.text('Thiếu nhi'));
    await tester.pumpAndSettle();
    expect(find.text('Tiếng Anh thiếu nhi'), findsOneWidget);

    await tester.tap(find.text('Khóa học'));
    await tester.pumpAndSettle();
    expect(find.text('Trực tuyến'), findsOneWidget);
    expect(tester.takeException(), isNull);

    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });

  testWidgets('truyện tranh và lồng tiếng đi hết luồng', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1000, 700);
    tester.view.devicePixelRatio = 1;
    await tester.pumpWidget(const EnglishLearningApp());

    await tester.tap(find.text('Thiếu nhi'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Mở'));
    await tester.pumpAndSettle();
    expect(find.text('Truyện'), findsOneWidget);
    await tester.tap(find.text('Truyện'));
    await tester.pumpAndSettle();
    expect(find.text('Mở rộng đọc'), findsOneWidget);
    await tester.tap(find.text('My Little Dog').first);
    await tester.pumpAndSettle();
    expect(find.text('My little dog'), findsOneWidget);

    await tester.tap(find.text('Đọc'));
    await tester.pumpAndSettle();
    expect(find.text('My name is Anna. I have a little dog. His name is Max.'), findsOneWidget);
    await tester.tap(find.byTooltip('Trang sau'));
    await tester.pumpAndSettle();
    expect(find.text('Max is small and cute. He has brown fur and big eyes.'), findsOneWidget);
    await tester.tap(find.byTooltip('Hoàn thành đọc'));
    await tester.pumpAndSettle();
    expect(find.textContaining('cuốn truyện tranh thứ 1'), findsOneWidget);

    await tester.tap(find.text('Lồng tiếng'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Bắt đầu lồng tiếng'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Bắt đầu ghi âm'));
    await tester.pumpAndSettle();
    expect(find.text('Đang ghi âm'), findsOneWidget);
    await tester.tap(find.byTooltip('Dừng ghi âm'));
    await tester.pumpAndSettle();
    expect(find.byTooltip('Xem kết quả hoàn thành'), findsOneWidget);
    await tester.tap(find.byTooltip('Xem kết quả hoàn thành'));
    await tester.pumpAndSettle();
    expect(find.text('Bạn đã hoàn thành bài lồng tiếng!'), findsOneWidget);
    await tester.tap(find.text('Quay lại'));
    await tester.pumpAndSettle();
    expect(find.text('Tiếng Anh thiếu nhi'), findsOneWidget);
    expect(tester.takeException(), isNull);

    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}
