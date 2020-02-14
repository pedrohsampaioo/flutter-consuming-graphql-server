import 'package:flutter_test/flutter_test.dart';
import 'package:using_graphql/app/shared/models/person_model.dart';
import 'package:using_graphql/app/shared/services/api_client.dart';
import 'package:using_graphql/app/shared/services/mutation_person_service.dart';

main() {
  ApiClient graphQLClient;
  MutationPersonService mutationPerson;
  setUp(() {
    graphQLClient = ApiClient();
    mutationPerson = MutationPersonService(graphQLClient: graphQLClient);
  });

  group("test the mutations", () {
    test("Person edit operation", () async {
      PersonModel model = PersonModel(
        name: "Test",
        id: "5",
        lastName: "test last name",
        age: 1,
      );
      final result = await mutationPerson.edit(model);
      expect(result, true);
    });

    test("Person delete operation", () async {
      PersonModel model = PersonModel(
        name: "Test",
        id: "9",
        lastName: "test last name",
        age: 1,
      );
      final result = await mutationPerson.delete(model.id);
      expect(result, true);
    });

    test("Person add operation", () async {
      PersonModel model = PersonModel(
        name: "Test",
        id: "5",
        lastName: "test last name",
        age: 1,
      );
      final result = await mutationPerson.add(model);
      expect(result, true);
    });
  });
}
