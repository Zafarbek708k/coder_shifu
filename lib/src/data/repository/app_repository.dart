
import 'package:coder_shifu/src/data/entity/search_model.dart';

abstract class AppRepository {
  /// crud

  Future<SearchModel?> search();
  Future<void> images();
  Future<void> videos();

}
