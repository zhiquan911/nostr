import 'dart:convert';

import 'package:dart_nostr/dart_nostr.dart';

void main(List<String> args) async {
  Nostr.instance.enableLogs();

  await Nostr.instance.relaysService.init(
    relaysUrl: [
      // 'wss://nostr.lbdev.fun',
      'wss://relay.damus.io',
      'wss://nostr.oxtr.dev',
      'wss://relay.primal.net',
    ],
    retryOnClose: true,
    retryOnError: true,
  );

  try {
    final request = NostrRequest(
      filters: [
        NostrFilter(
          e: ['9e86ff721b160f856315cd8c0df8399f1fbccf38f7ce7f8f3015bb2f00b1ca94'],
        ),
      ],
    );

    final events = await Nostr.instance.relaysService.startEventsSubscriptionAsync(
      request: request,
      timeout: const Duration(seconds: 10),
    );
    print('events size: ${events.length}');
    for (final element in events) {
      // should our event content here
      print('${element.content}\n\n');
    }

    // final sub = Nostr.instance.relaysService.startEventsSubscription(
    //   request: request,
    // );
    //
    // sub.stream.listen((event) {
    //   print('${event.content}\n\n');
    // });

    final isFree = await Nostr.instance.relaysService.freeAllResources();
    print('isFree: $isFree');
  } catch (e) {
    print(e);
  }
}
