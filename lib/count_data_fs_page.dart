import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reverpod_udemy/data/count_data_fs.dart';
import 'package:flutter_reverpod_udemy/repository/count_data_dao.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountDataFsPage extends StatefulWidget {
  const CountDataFsPage(this.title, {super.key});

  final String title;

  @override
  State<CountDataFsPage> createState() => _CountDataFsPageState();
}

class _CountDataFsPageState extends State<CountDataFsPage> {
  int _counter = 0;
  final CountDataDao _countDataDao = CountDataDao();
  late StreamProvider _streamProvider;

  @override
  void initState() {
    super.initState();
    _streamProvider = StreamProvider((ref) => _countDataDao
        .getSnapshots()
        .map((event) => event.docs.map((e) => _convert(e.data())).toList()));
  }

  CountDataFs _convert(Object? obj) {
    if (obj == null) {
      return CountDataFs(dateTime: DateTime.now(), count: -1);
    }
    var map = obj as Map<String, dynamic>;
    return CountDataFs.fromJson(map);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    CountDataFs countData = CountDataFs(
      dateTime: DateTime.now(),
      count: _counter,
    );
    _countDataDao.saveCountData(countData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Consumer(
              builder: (context, ref, child) {
                final provider = ref.watch(_streamProvider);
                return provider.when(
                  data: (data) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        CountDataFs countData = data[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text('${countData.dateTime}'),
                            trailing: Text('${countData.count}'),
                            tileColor: Colors.lightBlueAccent,
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stackTrace) => Text('Error: $error'),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "reset",
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(CupertinoIcons.plus),
      ),
    );
  }
}
