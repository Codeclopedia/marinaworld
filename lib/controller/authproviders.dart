import '/core/state.dart';
import '/data/network/api_service.dart';
import '/data/remote/auth_data_source.dart';
import '/data/remote/auth_data_source_impl.dart';

final authDataSourceProvider = Provider<AuthDataSource>(
  (ref) => AuthDataSourceImpl(
    api: ref.read(apiServiceProvider),
  ),
);

final authLoadProvider = FutureProvider.autoDispose(
  (ref) async => ref.watch(authDataSourceProvider).init(),
);

// final authChangesProvider = StreamProvider(
//   (ref) => ref.watch(authDataSourceProvider).authStateChanges,
// );
