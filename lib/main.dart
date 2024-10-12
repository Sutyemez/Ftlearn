import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

  print('main çalıştıı ');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('My app build çalıştı ');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState() {
    print("myHomepage");
  }
  int aktifbuton = 0 ;
  int _counter = 0;

  void _incrementCounter() {
    print(' _incrementCounter  çalıştı ');
    setState(() {
      _counter++;
    });
  }
  bool check = false ;
  //String text = '';
  String istenenYazi = 'İİ';

  int sinif = 4 ;
  String baslik = 'ogrenciler';
  List<String> ogrenciler = ['Ali','Ayşe','Can'];
  TextEditingController _controller = TextEditingController();
  var ogrenciEkle;

  @override
  Widget build(BuildContext context) {
    print('MyhomePageState çalıştıii ');

    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            'MeetUp',
            textAlign: TextAlign.center, // Düzeltilmiş kısım
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print('eklendi');
              },
            ),
            Icon(Icons.remove),
          ],
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.

          child: Column(

            //mainAxisSize: MainAxisSize.min,

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.star
                  ),
                  Text(
                    '$sinif',
                    textScaleFactor: 2,
                  ),
                  Icon(Icons.star
                  ),
                ],
              ),
              Text(
                '$baslik',
                textScaleFactor: 1.5,
              ),
              for (final o in ogrenciler)
                Text(o),
              TextField(
                controller: _controller,
                onChanged: (value){
                  setState(() {
                    ogrenciEkle = value;
                  });

                },
              ),
              ElevatedButton(onPressed: () {
                  setState(() {
                    ogrenciler.add(ogrenciEkle);
                  });
              },
              child:
              Text('Ekle'),
              ),

              yaziYeri(
                  istenenYazi: istenenYazi,

              ),
              Text('Yazı Şu şekilde: ${istenenYazi}'),

              Checkbox(
                  value: check,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      if (value != null) {
                        check = value;
                      }
                    });
                  }),
              ElevatedButton(
                  onPressed: aktifbuton == 0
                      ? () {
                          setState(() {
                            aktifbuton = 1;
                            istenenYazi = 'sıfır';
                          });
                          print("0");
                        }
                      : null,
                  child: Text('0')),
              ElevatedButton(
                  onPressed: aktifbuton == 1 ?() {

                    print("1");
                    setState(() {
                      aktifbuton = 0;
                      istenenYazi = 'bir';
                    });
                  } : null ,
                  child:
                  Text('1')
              ),

              const Text(
                'You have pushed the button this many times: merhabaaa',
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                '${_counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  _incrementCounter();
                  print("Artııııı");
                },
                child: Text(
                  "Increment",
                ),
              ),
              yazi('şuanki değer  $_counter'),
              sayac(
                d: 'sayac deger dışarı $_counter',
                ilk: 2,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Ekle'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Çıkar'),
          ],
        ));
  }
}

class yaziYeri extends StatefulWidget {
  final String istenenYazi;

  const yaziYeri({
    super.key, required this.istenenYazi
  });


  @override
  State<yaziYeri> createState() => _yaziYeriState();
}

class _yaziYeriState extends State<yaziYeri> {

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      print('$controller');

    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  void didUpdateWidget(covariant yaziYeri oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    if(oldWidget.istenenYazi != widget.istenenYazi){
      controller.text = widget.istenenYazi;
    }
  }


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ,
      onChanged: (value) {
        print(value);

      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            controller.text = '';
          },
        )
      ),
    );
  }
}

class yazi extends StatelessWidget {
  final String s;

  const yazi(this.s, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(s);
  }
}

class sayac extends StatefulWidget {
  final String d;
  final int ilk;

  const sayac({required this.d, required this.ilk, super.key});

  @override
  State<sayac> createState() => _sayacState();
}

class _sayacState extends State<sayac> {
  int sayi = 0;

  @override
  void initState() {
    super.initState();
    sayi = widget.ilk;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print("Gelecekte basıldı.");
        setState(() {
          sayi++;
        });
      },
      child: Text('${widget.d} $sayi'),
    );
  }
}
