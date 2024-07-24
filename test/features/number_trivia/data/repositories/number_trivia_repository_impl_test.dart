// import generated mock classes
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia/core/platform/network_info.dart';
import 'package:trivia/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:trivia/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:trivia/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:trivia/features/number_trivia/domain/entities/number_trivia.dart';

@GenerateNiceMocks(
    [MockSpec<NumberTriviaRepositoryImpl>(), MockSpec<NetworkInfo>()])
import './number_trivia_repository_impl_test.mocks.dart';

// class MockRemoteDataSource extends Mock
//     implements NumberTriviaRemoteDataSource {}

// class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

void main() {
  late MockNumberTriviaRepositoryImpl repository;
  // MockRemoteDataSource mockRemoteDataSource;
  // MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    // mockRemoteDataSource = MockRemoteDataSource();
    // mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = MockNumberTriviaRepositoryImpl();
  });

  group('getConcreteNumberTrivia', () {
    final tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel(text: 'test trivia', number: tNumber);
    final NumberTrivia tNumberTrivia = tNumberTriviaModel;
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getConcreteNumberTrivia(tNumber);
      // asset
      verifyNever(mockNetworkInfo.isConnected);
    });
  });
}
