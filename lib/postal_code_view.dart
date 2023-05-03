import 'package:flutter/material.dart';
import 'package:flutter_reverpod_udemy/postal_code_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostalCodeView extends ConsumerWidget {
  const PostalCodeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final postalCode = ref.watch(apiProvider).asData; //.value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostalCode'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (text) => onPostalCodeChanged(text, ref),
              ),
              Expanded(
                child: ref.watch(apiProvider).when(
                  data: (data) {
                    return ListView.separated(
                      itemCount: data.data.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.data[0].en.prefecture),
                            Text(data.data[0].en.address1),
                            Text(data.data[0].en.address2),
                            Text(data.data[0].en.address3),
                            Text(data.data[0].en.address4),
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const Divider(color: Colors.black),
                    );
                  },
                  loading: () {
                    return const AspectRatio(
                      aspectRatio: 1,
                      child: CircularProgressIndicator(),
                    );
                  },
                  error: (error, stackTrace) {
                    return Text(error.toString());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPostalCodeChanged(String text, WidgetRef ref) {
    if (text.length != 7) {
      return;
    }

    try {
      int.parse(text);
      ref.watch(postalCodeProvider.notifier).update((state) => text);
    } catch (ex) {}
  }
}
