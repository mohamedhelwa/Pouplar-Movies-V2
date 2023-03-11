part of 'GeneralRepoImports.dart';

class GeneralRepository {
  late BuildContext _context;
  late GeneralHttpMethods _generalHttpMethods;
  GeneralRepository(BuildContext context) {
    _context = context;
    _generalHttpMethods = GeneralHttpMethods(_context);
  }

  Future<List<MovieModel>> getPopularMovies(bool refresh) async =>
      _generalHttpMethods.getPopularMovies(refresh);
}
