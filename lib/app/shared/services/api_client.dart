import 'package:graphql/client.dart';

class ApiClient {
  static final HttpLink _httpLink = HttpLink(
    uri: "https://examplegraphql.herokuapp.com/graphql",
  );

  final GraphQLClient client =
      GraphQLClient(link: _httpLink, cache: InMemoryCache());
}
