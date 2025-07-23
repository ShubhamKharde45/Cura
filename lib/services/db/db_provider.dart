import 'package:cura/services/db/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final DbProvider = Provider<Database>((ref) {
  return Database();
});