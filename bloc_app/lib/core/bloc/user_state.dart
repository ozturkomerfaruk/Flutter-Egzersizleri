part of 'user_bloc.dart';

//user getirme
class FetchResult {
  final List<User> users;
  final bool isCache;

  FetchResult({
    this.users = const [],
    this.isCache = false,
  });

  @override
  bool operator ==(covariant FetchResult other) {
    return users.isEqualOrIgnoring(other.users) &&
        isCache == other.isCache; // o zaman yapılar kesinlikle eşittir.
  }

  @override
  int get hashCode => Object.hash(users, isCache);
}

//Eger bu FetchResult başka bir FetchResult ile karşılaştırılması isteniorsa Equatable kullanılabilir. detayları bilmiyorum.

