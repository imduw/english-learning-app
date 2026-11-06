class VocabularyWord {
  const VocabularyWord({
    required this.word,
    required this.isMastered,
    required this.isSelected,
  });

  final String word;
  final bool isMastered;
  final bool isSelected;

  VocabularyWord copyWith({bool? isSelected}) => VocabularyWord(
    word: word,
    isMastered: isMastered,
    isSelected: isSelected ?? this.isSelected,
  );
}
