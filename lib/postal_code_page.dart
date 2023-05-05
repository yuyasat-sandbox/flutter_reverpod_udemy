import 'package:flutter/material.dart';
import 'package:flutter_reverpod_udemy/postal_code_provider.dart';
import 'package:flutter_reverpod_udemy/postal_code_page_vm.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostalCodePage extends ConsumerStatefulWidget {
  const PostalCodePage({super.key});

  @override
  ConsumerState<PostalCodePage> createState() => _PostalCodePageState();
}

class _PostalCodePageState extends ConsumerState<PostalCodePage> {
  final PostalCodePageVm _vm = PostalCodePageVm();

  @override
  void initState() {
    super.initState();
    _vm.setRef(ref);
  }

  @override
  Widget build(BuildContext context) {
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
                onChanged: _vm.onPostalCodeChanged,
              ),
              Expanded(
                child: _vm.postalCodeWithFamily(_vm.postalCode).when(
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
}
