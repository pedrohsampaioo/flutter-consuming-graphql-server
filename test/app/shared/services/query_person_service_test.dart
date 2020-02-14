import 'package:flutter_test/flutter_test.dart';
import 'package:using_graphql/app/shared/models/person_model.dart';
import 'package:using_graphql/app/shared/services/api_client.dart';
import 'package:using_graphql/app/shared/services/query_person_service.dart';

main() {
  ApiClient client;
  QueryPersonService queryPerson;
  setUp(() {
    client = ApiClient();
    queryPerson = QueryPersonService(graphQLClient: client);
  });

  test("check if the query is working", () async {
    final result = await queryPerson.fetchAll();
    expect(result, isInstanceOf<List<PersonModel>>());
  });
}
