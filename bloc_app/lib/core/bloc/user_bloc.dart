import 'package:bloc/bloc.dart';
import 'package:bloc_app/core/extensions/app_ext.dart';
import 'package:bloc_app/services/user_service.dart';

import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

typedef PersonLoader = Future<List<User>> Function(UserUrl);

class UserBloc extends Bloc<LoadAction, FetchResult?> {
  UserBloc() : super(null) {
    on<LoadPersonAction>(_onLoadPerson);
  }
  final Map<UserUrl, Iterable<User>> _cached = {}; //jsondaki her bir veri.

  Future<void> _onLoadPerson(
      LoadPersonAction event, Emitter<FetchResult?> emit) async {
    final UserUrl url = event.url;
    if (_cached.containsKey(url)) {
      final cachedUsers = _cached[url]!;
      emit(FetchResult(users: cachedUsers.toList(), isCache: true));
      'Data From Cache'.log();
    } else {
      final PersonLoader = event.onLoader;
      final userFromService = await PersonLoader(url);
      _cached[url] = userFromService;
      emit(FetchResult(users: userFromService, isCache: false));
      'Data From Service'.log();
    }
  }
  //Ne zaman bir UserBlock nesnesi oluşturulacka o zaman _onLoadPerson çalışacak.
}
