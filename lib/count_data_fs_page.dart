import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reverpod_udemy/data/count_data_fs.dart';
import 'package:flutter_reverpod_udemy/repository/count_data_dao.dart';

class CountDataFsPage extends StatefulWidget {
  const CountDataFsPage(this.title, {super.key});

  final String title;

  @override
  State<CountDataFsPage> createState() => _CountDataFsPageState();
}

class _CountDataFsPageState extends State<CountDataFsPage> {
  int _counter = 0;
  final CountDataDao _countDataDao = CountDataDao();

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
              _counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
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
