import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../bloc/bloc_actions.dart';
import '../bloc/bloc_provider.dart';
import '../models/person.dart';

List<Person> mocPersons1 = const [
  Person(name: 'mohamed', age: 24),
  Person(name: 'saad', age: 23),
];

List<Person> mocPersons2 = const [
  Person(name: 'ahmed', age: 24),
  Person(name: 'said', age: 23),
];
Future<Iterable<Person>> mocPerson1(String _) => Future.value(mocPersons1);
Future<Iterable<Person>> mocPerson2(String _) => Future.value(mocPersons2);

void main() {
  group(
    'lest Test Person Bloc',
    () {
      late PersonsBloc bloc;
      setUp(
        () => bloc = PersonsBloc(),
      );
      blocTest<PersonsBloc, FetchResult?>(
        'testing initial State',
        build: () => bloc,
        verify: (bloc) => bloc.state == null,
      );

      blocTest<PersonsBloc, FetchResult?>(
        'testing mocPerson 1',
        build: () => bloc,
        act: (bloc) {
          bloc.add(
            const LoadPersonsAction(
              url: 'dummy_url_1',
              loader: mocPerson1,
            ),
          );
          bloc.add(
            const LoadPersonsAction(
              url: 'dummy_url_1',
              loader: mocPerson1,
            ),
          );
        },
        expect: () => [
          FetchResult(
            persons: mocPersons1,
            isRetrievedFromCache: false,
          ),
          FetchResult(
            persons: mocPersons1,
            isRetrievedFromCache: true,
          ),
        ],
      );

      /// mocPerson 2 data
      blocTest<PersonsBloc, FetchResult?>(
        'testing mocPerson 2',
        build: () => bloc,
        act: (bloc) {
          bloc.add(
            const LoadPersonsAction(
              url: 'dummy_url_2',
              loader: mocPerson2,
            ),
          );
          bloc.add(
            const LoadPersonsAction(
              url: 'dummy_url_2',
              loader: mocPerson2,
            ),
          );
        },
        expect: () => [
          FetchResult(
            persons: mocPersons2,
            isRetrievedFromCache: false,
          ),
          FetchResult(
            persons: mocPersons2,
            isRetrievedFromCache: true,
          ),
        ],
      );
    },
  );
}
