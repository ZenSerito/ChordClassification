final class ApiEndpoints {
  static const chapter = "chapters/";
  static String verse(int chapterId) => "$chapter$chapterId/verses/";
  static String particularVerse(int chapterId, int verseId) =>
      "${verse(chapterId)}$verseId/";
}
