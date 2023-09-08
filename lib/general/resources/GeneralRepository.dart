part of 'GeneralRepoImports.dart';

class GeneralRepository {
  late BuildContext _context;
  late GeneralHttpMethods _generalHttpMethods;
  GeneralRepository(BuildContext context) {
    _context = context;
    _generalHttpMethods = GeneralHttpMethods(_context);
  }

  Future<List<MovieModel>> getPlayingNowMovies(int page) async =>
      _generalHttpMethods.getPlayingNowMovies(page);

  Future<List<MovieModel>> searchForMovie(String query, int page) async =>
      _generalHttpMethods.searchForMovie(query, page);
}
