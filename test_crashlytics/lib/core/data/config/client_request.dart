import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_crashlytics/core/data/config/gql_config.dart';
import 'package:test_crashlytics/core/data/models/film_model.dart';
import 'package:test_crashlytics/core/utils/function.dart';

class ClientRequest {
  GraphQLClient getClient() {
    GraphQLConfig graphQLAuthConfig = GraphQLConfig();
    GraphQLClient client = graphQLAuthConfig.clientToQuery();
    return client;
  }

  String queryListFilms() {
    return '''
  query {
  allFilms {
    films {
      title
    }
  }
}
    ''';
  }

  Future<ResultFilm> getListFilm() async {
    ResultFilm resultFilms = ResultFilm();
    try {
      QueryResult result = await getClient().query(
        QueryOptions(
          document: gql(
            queryListFilms(),
          ),
        ),
      );
      function.printResponse("ListFilms", result.data.toString());
      if (result.data != null) {
        List<Film> films = [];
        result.data?["allFilms"]["films"].forEach((element) {
          var data = Film.fromJson(element);
          films.add(data);
        });
        resultFilms = ResultFilm(status: true, list: films);
      }
      if (result.hasException) {
        resultFilms =
            ResultFilm(status: false, message: result.exception.toString());
      }
      return resultFilms;
    } catch (e) {
      resultFilms = ResultFilm(status: false, message: e.toString());
      return resultFilms;
    }
  }
}
