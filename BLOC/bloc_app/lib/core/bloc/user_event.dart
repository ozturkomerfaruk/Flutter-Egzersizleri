part of 'user_bloc.dart';

abstract class LoadAction {
  const LoadAction();
}

class LoadPersonAction extends LoadAction {
  final UserUrl url;
  final PersonLoader onLoader;

  LoadPersonAction({
    required this.url,
    required this.onLoader,
  });
}
