import 'package:forDev/data/cache/cache.dart';
import 'package:forDev/data/usecases/local_current_account/local_current_account.dart';
import 'package:forDev/domain/entities/entities.dart';
import 'package:forDev/domain/helpers/domain_error.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


class FetchSecureCacheStorageSpy extends Mock implements FetchSecureCacheStorage {}

void main() {
  late LocalLoadCurrentAccount sut;
  late FetchSecureCacheStorageSpy fetchSecureCacheStorage;
  late String token;

  When mockFetchSecureCall() => when(() => fetchSecureCacheStorage.fetch(any()));

  void mockFetchSecure(String? data) {
    mockFetchSecureCall().thenAnswer((_) async => data);
  }

  void mockFetchSecureError() {
    mockFetchSecureCall().thenThrow(Exception());
  }

  setUp(() {
    fetchSecureCacheStorage = FetchSecureCacheStorageSpy();
    sut = LocalLoadCurrentAccount(fetchCacheStorage: fetchSecureCacheStorage);
    token = faker.guid.guid();
    mockFetchSecure(token);
  });

  test('Should call FetchSecureCacheStorage with correct value', () async {
    
    await sut.load();

    verify(() => fetchSecureCacheStorage.fetch('token'));
  });

  test('Should return an AccountEntity', () async {
    final account = await sut.load();

    expect(account, AccountEntity(token));
  });

  test('Should throw UnexpectedError if FetchSecureCacheStorage throws', () async {
    mockFetchSecureError();

    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if FetchSecureCacheStorage return null', () async {
    mockFetchSecure(null);

    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });
}