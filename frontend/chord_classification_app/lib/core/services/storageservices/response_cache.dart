import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../abstractservices/storage_services.dart';
import '../../../modules/injection_container.dart';

class ResponseCache {
  ResponseCache(this.storageServices);
  final StorageServices storageServices;

  Future<void> storeResponse(String key, dynamic data) async {
    await storageServices.set(key, jsonEncode(data));
  }

  Future<String> getResponse(String key) async {
    final data = await storageServices.get(key);
    return data ?? '';
  }
}

final responseCacheProvider =
    Provider((ref) => ResponseCache(ref.read(storageServiceProvider)));
