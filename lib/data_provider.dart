
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/services/http_get_service.dart';

final userDataProvider=FutureProvider((ref)async{
  return ref.watch(userProvider).getusers();
});