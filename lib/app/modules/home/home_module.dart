import 'package:flutter_modular/flutter_modular.dart';
import 'package:using_graphql/app/modules/home/home_bloc.dart';
import 'package:using_graphql/app/modules/home/home_page.dart';
import 'package:using_graphql/app/shared/services/api_client.dart';
import 'package:using_graphql/app/shared/services/mutation_person_service.dart';
import 'package:using_graphql/app/shared/services/query_person_service.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ApiClient()),
        Bind((i) => MutationPersonService(graphQLClient: i.get<ApiClient>())),
        Bind((i) => QueryPersonService(graphQLClient: i.get<ApiClient>())),
        Bind(
          (i) => HomeBloc(
            mutationPerson: i.get<MutationPersonService>(),
            queryPerson: i.get<QueryPersonService>(),
          ),
        )
      ];

  @override
  List<Router> get routers => [
        Router("/", child: (_, args) => HomePage()),
      ];
}
