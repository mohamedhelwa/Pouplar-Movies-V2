part of 'GeneralRepoImports.dart';

class GeneralHttpMethods {
  final BuildContext context;

  GeneralHttpMethods(this.context);

  Future<List<MovieModel>> getPopularMovies(bool refresh) async {
    return await GenericHttp<MovieModel>(context).callApi(
      name: "${ApiNames.popularMoviesList}?api_key=${ApiNames.apiKey}",
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      returnDataFun: (data) => data["results"],
      refresh: refresh,
      toJsonFunc: (json) => MovieModel.fromJson(json),
      showLoader: false,
    ) as List<MovieModel>;
  }
}
