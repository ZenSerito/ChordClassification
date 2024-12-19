// import 'package:flutter/cupertino.dart';
// import 'package:flutter_gemini/flutter_gemini.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AiNotifier extends ChangeNotifier {
//   final String _requestMessage = """
      
//        """;

//   bool isAnalyzing = false;
//   late Gemini gemini;

//   String message = 'Summarize this result in bullets in  Markdown format';

//   AiNotifier() {
//     try {
//       Gemini.init(apiKey: "AIzaSyChoAZe4XqvrnRQOXN8VJlNwnZdKtOEOHk");
//       gemini = Gemini.instance;
//     } catch (e) {
//       print("hello $e");
//     }
//   }

//   Future getResponse(AiResponse response) async {
//     Candidates? aiResponse;
//     isAnalyzing = true;
//     notifyListeners();
//     try {
//       aiResponse = await gemini.prompt(
//           parts: [Part.text('${response.questions!} $_requestMessage')]);
//       message = aiResponse?.output;
//       isAnalyzing = false;
//       notifyListeners();
//     } on Exception catch (e) {
//       isAnalyzing = false;
//       notifyListeners();
//       print("hello $e");
//     }
//   }
// }

// final aiNotifierProvider = ChangeNotifierProvider((ref) => AiNotifier());
