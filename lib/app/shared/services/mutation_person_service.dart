import 'package:graphql/client.dart';
import 'package:using_graphql/app/shared/models/person_model.dart';
import 'package:using_graphql/app/shared/services/api_client.dart';
import 'package:meta/meta.dart';

class MutationPersonService {
  ApiClient graphQLClient;
  MutationPersonService({@required this.graphQLClient});

  Future<bool> edit(PersonModel person) async {
    const String _editPerson = r'''
      mutation ($id: ID! , $name: String!, $age: Int!, $lastName: String!){
        editPerson(id: $id, name: $name, age: $age, lastName: $lastName){
          id
          name
          lastName
          age
        }
      }
    ''';
    final MutationOptions _option = MutationOptions(
        documentNode: gql(_editPerson),
        variables: <String, dynamic>{
          "id": person.id,
          "name": person.name,
          "age": person.age,
          "lastName": person.lastName,
        });
    final QueryResult result = await graphQLClient.client.mutate(_option);
    if (result.hasException) {
      print(result.hasException.toString());
      return false;
    }
    return true;
  }

  Future<bool> delete(String id) async{
    final _deletePerson = r'''
    mutation($id: ID!){
      deletePerson(id: $id){
        id
        name
      }
    }
    ''';
    final _options = MutationOptions(
      documentNode: gql(_deletePerson),
      variables: <String, dynamic>{
        "id": id,
      },
    );
    final result = await graphQLClient.client.mutate(_options);
    if(result.hasException){
      print(result.hasException);
      return false;
    }
    return true;
  }

  Future<bool> add(PersonModel person)async{
    final _addPerson = r'''
    mutation($id: ID!, $name: String!, $lastName: String!, $age: Int!){
      addPerson(id: $id, name: $name, lastName: $lastName, age: $age){
        id
        name
        lastName
        age
      }
    }
    ''';
    final MutationOptions _option = MutationOptions(
        documentNode: gql(_addPerson),
        variables: <String, dynamic>{
          "id": person.id,
          "name": person.name,
          "age": person.age,
          "lastName": person.lastName,
        });
    final QueryResult result = await graphQLClient.client.mutate(_option);
    if (result.hasException) {
      print(result.hasException.toString());
      return false;
    }
    return true;
  }
}
