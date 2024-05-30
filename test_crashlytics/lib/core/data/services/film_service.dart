import 'package:test_crashlytics/core/data/config/client_request.dart';
import 'package:test_crashlytics/core/data/models/film_model.dart';

class FilmService {
  ClientRequest clientRequest = ClientRequest();

  Future<ResultFilm> getListFilms() {
    Future<ResultFilm> result = clientRequest.getListFilm();
    return result;
  }
}

var filmService = FilmService();
