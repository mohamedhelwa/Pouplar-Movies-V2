part of 'GeneralRepoImports.dart';

class GeneralHttpMethods {
  final BuildContext context;

  GeneralHttpMethods(this.context);

  Future<List<MovieModel>> getPlayingNowMovies(int page) async {
    return await GenericHttp<MovieModel>(context).callApi(
      name: "${ApiNames.nowPlayingMoviesList}"
          "?language=${WidgetUtils.lang == "en" ? "en-US" : "ar-EG"}"
          "&api_key=${ApiNames.apiKey}&page=$page",
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      returnDataFun: (data) => data["results"],
      toJsonFunc: (json) => MovieModel.fromJson(json),
      showLoader: false,
    ) as List<MovieModel>;
  }

  Future<List<MovieModel>> searchForMovie(String query, int page) async {
    return await GenericHttp<MovieModel>(context).callApi(
      name: "${ApiNames.searchForMovie}?query=$query"
          "&include_adult=false"
          "&language=${WidgetUtils.lang == "en" ? "en-US" : "ar-EG"}"
          "&api_key=${ApiNames.apiKey}&page=$page",
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      returnDataFun: (data) => data["results"],
      toJsonFunc: (json) => MovieModel.fromJson(json),
      showLoader: false,
    ) as List<MovieModel>;
  }
}
