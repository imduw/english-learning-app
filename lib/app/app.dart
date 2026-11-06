import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../features/assessments/screens/assessment_review_screen.dart';
import '../features/assessments/screens/assessment_screen.dart';
import '../features/courses/screens/course_category_screen.dart';
import '../features/courses/screens/course_discovery_screen.dart';
import '../features/courses/screens/course_level_catalog_screen.dart';
import '../features/courses/screens/lesson_list_screen.dart';
import '../features/courses/screens/my_courses_screen.dart';
import '../features/learning/screens/child_learning_path_screen.dart';
import '../features/learning/screens/learning_path_screen.dart';
import '../features/stories/screens/picture_story_screen.dart';
import '../features/stories/screens/story_library_screen.dart';
import '../features/stories/screens/storybook_experience_screens.dart';
import '../features/stories/screens/voiceover_flow_screens.dart';
import '../features/vocabulary/screens/audio_image_choice_screen.dart';
import '../features/vocabulary/screens/audio_image_result_screen.dart';
import '../features/vocabulary/screens/vocabulary_image_screen.dart';
import '../features/vocabulary/screens/vocabulary_image_choice_screen.dart';
import '../features/vocabulary/screens/vocabulary_image_result_screen.dart';
import '../features/vocabulary/screens/vocabulary_review_screen.dart';

abstract final class AppRoutes {
  static const learningPath = '/learning/path';
  static const childLearningPath = '/children/learning-path';
  static const childLearningSkills = '/children/learning-path/skills';
  static const storyLibrary = '/stories/library';
  static const storyLevelInfo = '/stories/levels';
  static const storyMode = '/stories/mode';
  static const storyPage1 = '/stories/book/1';
  static const storyPage2 = '/stories/book/2';
  static const storyReadComplete = '/stories/book/complete';
  static const voiceoverStart = '/stories/voiceover/start';
  static const voiceoverRecording = '/stories/voiceover/recording';
  static const voiceoverResult = '/stories/voiceover/result';
  static const voiceoverComplete = '/stories/voiceover/complete';
  static const vocabularyReview = '/vocabulary/review';
  static const vocabularyImage = '/vocabulary/image';
  static const vocabularyImageChoice = '/vocabulary/image/choose-word';
  static const vocabularyImageResult = '/vocabulary/image/answer';
  static const audioImageChoice = '/vocabulary/audio/choose-image';
  static const audioImageResult = '/vocabulary/audio/answer';
  static const pictureStory = '/stories/picture-book';
  static const courseCategory = '/courses/category';
  static const courseLevels = '/courses/levels';
  static const lessonList = '/courses/lessons';
  static const courseDiscovery = '/';
  static const myCourses = '/courses/mine';
  static const assessment = '/assessment';
  static const assessmentReview = '/assessment/review';
}

class EnglishLearningApp extends StatelessWidget {
  const EnglishLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiếng Anh mỗi ngày',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.courseDiscovery,
      routes: {
        AppRoutes.courseCategory: (_) => const CourseCategoryScreen(),
        AppRoutes.courseLevels: (_) => const CourseLevelCatalogScreen(),
        AppRoutes.lessonList: (_) => const LessonListScreen(),
        AppRoutes.courseDiscovery: (_) => const CourseDiscoveryScreen(),
        AppRoutes.myCourses: (_) => const MyCoursesScreen(),
        AppRoutes.assessment: (_) => const AssessmentScreen(),
        AppRoutes.assessmentReview: (context) => AssessmentReviewScreen(
          selectedAnswers:
              ModalRoute.of(context)?.settings.arguments as Map<int, String>?,
        ),
        AppRoutes.learningPath: (_) => const LearningPathScreen(),
        AppRoutes.childLearningPath: (_) => const ChildLearningPathScreen(),
        AppRoutes.childLearningSkills: (_) =>
          const ChildLearningPathScreen(showSkillsInitially: true),
        AppRoutes.storyLibrary: (_) => const StoryLibraryScreen(),
        AppRoutes.storyLevelInfo: (_) => const StoryLevelInfoScreen(),
        AppRoutes.storyMode: (_) => const StoryModeScreen(),
        AppRoutes.storyPage1: (_) => const StoryBookPageScreen(page: 1),
        AppRoutes.storyPage2: (_) => const StoryBookPageScreen(page: 2),
        AppRoutes.storyReadComplete: (_) => const StoryReadingCompleteScreen(),
        AppRoutes.voiceoverStart: (_) => const VoiceoverStartScreen(),
        AppRoutes.voiceoverRecording: (_) => const VoiceoverRecordingScreen(),
        AppRoutes.voiceoverResult: (_) => const VoiceoverResultScreen(),
        AppRoutes.voiceoverComplete: (_) => const VoiceoverCompleteScreen(),
        AppRoutes.vocabularyReview: (_) => const VocabularyReviewScreen(),
        AppRoutes.vocabularyImage: (_) => const VocabularyImageScreen(),
        AppRoutes.vocabularyImageChoice: (_) =>
            const VocabularyImageChoiceScreen(),
        AppRoutes.vocabularyImageResult: (_) =>
            const VocabularyImageResultScreen(),
        AppRoutes.audioImageChoice: (_) => const AudioImageChoiceScreen(),
        AppRoutes.audioImageResult: (_) => const AudioImageResultScreen(),
        AppRoutes.pictureStory: (_) => const PictureStoryScreen(),
      },
    );
  }
}
