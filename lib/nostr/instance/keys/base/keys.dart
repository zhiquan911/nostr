import 'package:dart_nostr/dart_nostr.dart';

abstract class NostrKeysBase {
  NostrKeyPairs generateKeyPair();
  NostrKeyPairs generateKeyPairFromExistingPrivateKey(String privateKey);
  String generatePrivateKey();
  String derivePublicKey({required String privateKey});
  String sign({required String privateKey, required String message});
}
