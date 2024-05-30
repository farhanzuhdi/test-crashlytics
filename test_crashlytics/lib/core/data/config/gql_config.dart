import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static HttpLink httpLinkWithoutHeader = HttpLink(dotenv.env['SWAPI']!);

  static ValueNotifier<GraphQLClient> graphInit() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
        GraphQLClient(link: httpLinkWithoutHeader, cache: GraphQLCache()));
    return client;
  }

  GraphQLClient clientToQuery() {
    return GraphQLClient(link: httpLinkWithoutHeader, cache: GraphQLCache());
  }
}
