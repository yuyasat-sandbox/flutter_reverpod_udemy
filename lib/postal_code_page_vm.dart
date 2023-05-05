import 'package:flutter_reverpod_udemy/data/postal_code.dart';
import 'package:flutter_reverpod_udemy/logic/postal_code_logic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _logicProvider = Provider<PostalCodeLogic>((ref) => PostalCodeLogic());
final _postalCodeProvider = StateProvider<String>((ref) => '');

AutoDisposeFutureProviderFamily<PostalCode, String> _apiFamilyProvider =
    FutureProvider.autoDispose
        .family<PostalCode, String>((ref, postalCode) async {
  PostalCodeLogic logic = ref.watch(_logicProvider);
  if (!logic.willProceed(postalCode)) {
    return PostalCode.empty;
  }
  return await logic.getPostalCode(postalCode);
});

class PostalCodePageVm {
  late final WidgetRef _ref;
  String get postalCode => _ref.watch(_postalCodeProvider);

  AsyncValue<PostalCode> postalCodeWithFamily(String postcode) =>
      _ref.watch(_apiFamilyProvider(postcode));

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  void onPostalCodeChanged(String value) {
    _ref.read(_postalCodeProvider.notifier).update((state) => value);
  }
}
