import 'package:graphql/client.dart';
import 'package:meta/meta.dart';
import 'package:using_graphql/app/shared/models/person_model.dart';
import 'package:using_graphql/app/shared/services/api_client.dart';

class QueryPersonService {
  final ApiClient graphQLClient;
  QueryPersonService({@required this.graphQLClient});
  final _readRepositories = r'''
  query{
	  persons{
  	  id
      name
      lastName
      age
    }
  }
  ''';

  Future<List<PersonModel>> fetchAll() async {
    final QueryOptions _options = QueryOptions(
      documentNode: gql(_readRepositories),
    );
    final QueryResult result = await graphQLClient.client.query(_options);
    List<PersonModel> list = [];
    if (result.hasException) {
      return list;
    }
    for (final person in result.data["persons"]) {
      final model = PersonModel(
        name: person["name"],
        lastName: person["lastName"],
        age: person["age"],
        id: person["id"],
      );
      list.add(model);
    }
    return list;
  }
}
