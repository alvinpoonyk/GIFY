import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gify/errors/failure.dart';
import 'package:gify/models/item.dart';
import 'package:gify/repositories/items_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'items_repository_test.mocks.dart';

@GenerateMocks([ItemsRepository])
void main() {

  late MockItemsRepository mockItemsRepository;
  late List<Item> items;


  setUp(() {
    mockItemsRepository = MockItemsRepository();
    items = <Item> [];
  });

  test('Should get list of items from the repository', () async {
    // arrange
    when(mockItemsRepository.getItems()).thenAnswer((_) async => Right(items));

    // act
    final result = await mockItemsRepository.getItems.call();

    // assert
    expect(result, Right(items));
    verify(mockItemsRepository.getItems());
    verifyNoMoreInteractions(mockItemsRepository);
  });

  test('Should get a failure from the repository', () async {
    // arrange
    when(mockItemsRepository.getItems()).thenAnswer((_) async => Left(Failure(type: 'any type', message: 'any message')));

    // act
    final failure = await mockItemsRepository.getItems.call();

    // assert
    expect(failure, TypeMatcher<Left>());
    verify(mockItemsRepository.getItems());
    verifyNoMoreInteractions(mockItemsRepository);
  });


}

