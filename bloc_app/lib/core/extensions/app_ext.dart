import 'dart:developer' as devtools show log;

const _url1 = 'http://127.0.0.1:5500/api/user1.json';
const _url2 = 'http://127.0.0.1:5500/api/user2.json';

enum UserUrl {
  users1,
  users2,
}

extension UserUrlExtension on UserUrl {
  String get urlToString {
    switch (this) {
      case UserUrl.users1:
        return _url1;
      case UserUrl.users2:
        return _url2;
      default:
        return "";
    }
  }
}

//List in içerisini mesela detaylı kıyaslama için
extension IsEqualOrIgnoring<T> on Iterable<T> {
  bool isEqualOrIgnoring(Iterable<T> other) {
    return length == other.length &&
        {...this}.intersection({...other}).length == length;
  }
}
////Burada gerçekleşen ifade de ilk önce uzunluklarını kıyaslıyor ardından da içerisinde intersection edildiğinde ki uzunluklar kıyaslanıyor.

extension Log on Object {
  void log() => devtools.log(toString());
}
