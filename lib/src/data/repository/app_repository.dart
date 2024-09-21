
import 'package:coder_shifu/src/data/entity/model.dart';
import 'package:coder_shifu/src/data/entity/model_2.dart';

import '../entity/movie_model.dart';

abstract class AppRepository {
  /// crud
  Future<Model?>upcomingMovies();
  Future<Model?>popularMovies();
  Future<Model?>topRatedMovies();

}
