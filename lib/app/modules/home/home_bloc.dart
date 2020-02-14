import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';
import 'package:using_graphql/app/shared/models/person_model.dart';
import 'package:using_graphql/app/shared/services/mutation_person_service.dart';
import 'package:using_graphql/app/shared/services/query_person_service.dart';
import 'package:meta/meta.dart';

class HomeBloc extends BlocBase {
  MutationPersonService mutationPerson;
  QueryPersonService queryPerson;

  HomeBloc({
    @required this.mutationPerson,
    @required this.queryPerson,
  });

  BehaviorSubject<List<PersonModel>> _person$ = BehaviorSubject<List<PersonModel>>();
  Stream<List<PersonModel>> get output => _person$.stream;

  Future<void> getPersons() async {
    final data = await queryPerson.fetchAll();
    _person$.add(data);
  }

  @override
  void dispose() {
    _person$.close();
    super.dispose();
  }
}
