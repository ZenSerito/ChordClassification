import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../abstractservices/storage_services.dart';
import '../core/services/api_services/api_service.dart';
import '../core/services/get.dart';


//service dependencies
final storageServiceProvider = Provider<StorageServices>((ref) {
  final box = Get.box;
  ref.onDispose(() => box.close);
  return box;
});

final apiServiceProvider = Provider((ref) => ApiManager(ref));

