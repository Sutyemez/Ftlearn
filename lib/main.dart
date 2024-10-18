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
     // home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
          '/': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
          '/settings' : (context) => SettingsPage(),
      },
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

  int aktifbuton = 0;

  int _counter = 0;

  void _incrementCounter() {
    print(' _incrementCounter  çalıştı ');
    setState(() {
      _counter++;
    });
  }

  bool check = false;

  //String text = '';
  String istenenYazi = 'İİ';

  int sinif = 4;

  String baslik = 'ogrenciler';
  List<String> ogrenciler = ['Ali', 'Ayşe', 'Can'];
  TextEditingController _controller = TextEditingController();
  var ogrenciEkle;

  void yeniOgrEkle(String yeniOgr){

    setState(() {
      ogrenciler = [...ogrenciler,yeniOgr];

    });
  }

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
              onPressed: () {
              Navigator.of(context).pushNamed('/settings');
              },
              icon: Icon(Icons.settings),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('eklendi');
            },
          ),
          Icon(Icons.remove),
        ],
      ),
      body: sinifBilgisi(
        sinif: sinif,
        baslik: baslik,
        ogrenciler: ogrenciler,
        yeniOgrEkle : yeniOgrEkle,
        child: Stack(
          fit: StackFit.expand,
          children: [
              arkaPlan(),
              Positioned(
                  top: 100,
                  left:150,
                  right: 150,
                  child: LayoutBuilder(
                    builder: (context , constraint){
                      if(constraint.maxWidth > 150){
                        return Row(
                          children: [
                          ogr(),
                            Expanded(child: Text("Seçildi")),
                          ],
                        );
                      }else{
                        return ogr();
                      }


                    }
                  ),
              ),
              Positioned(
                bottom: 50,
                left:30,
                right: 30,
                child: ogrEkle(),

              ),



          ],
        ),
      ),
    );
  }
}

class sinifBilgisi extends InheritedWidget {
  const sinifBilgisi({
    super.key,
    required this.sinif,
    required this.baslik,
    required this.ogrenciler,
    required this.yeniOgrEkle,
    required Widget child,
  }) : super(child: child);

  final int sinif;
  final String baslik;
  final List<String> ogrenciler;
  final void Function(String yeniOgr) yeniOgrEkle;


  static sinifBilgisi of(BuildContext context) {
    final sinifBilgisi? result = context.dependOnInheritedWidgetOfExactType<sinifBilgisi>();
    assert(result != null, 'No sinifBilgisi found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(sinifBilgisi old) {
    return sinif != old.sinif ||
        baslik != old.baslik ||
        ogrenciler != old.ogrenciler ||
        yeniOgrEkle != old.yeniOgrEkle;
  }
}

class ogr extends StatelessWidget {
  const ogr({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final sinifbilgisi = sinifBilgisi.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.star),
            Text(
              '${sinifbilgisi.sinif}',
              textScaleFactor: 2,
            ),
            Icon(Icons.star),
          ],
        ),
        Text(
          '${sinifbilgisi.baslik}',
          textScaleFactor: 1.5,
        ),
        ogrList(),
        ElevatedButton(
            child: Text("Yeni sayfa"),
            onPressed: ()  {
              // final cevap = await Navigator.of(context).push<bool>(MaterialPageRoute(
               SOR(context);
            })
      ],
    );
  }

  Future<void> SOR(BuildContext context) async {
    try {
      bool? cevap =
          await Navigator.of(context).push<bool>(MaterialPageRoute(
        builder: (context) {
          return Ekran2("Beğendiniz mi");
        },
      ));
      if (cevap == true) {
        print("Beğendiiiii");
        //throw "HATA OLUSN";
      } else {
        cevap =
            await Navigator.of(context).push<bool>(MaterialPageRoute(
          builder: (context) {
            return Ekran2(
                " Keşke beğenseydiniz yeaaaaağ Beğendiniz mi");
          },
        ));
      }
      if (cevap == true) {
        print("BEĞENDİİİ");
      }
    } catch (e) {
      print("HATATATATA");
    } finally {
      print("----BİTİTİTİTİT---");
    }
  }
}

class Ekran2 extends StatelessWidget {
  final String mesaj;

  const Ekran2(this.mesaj, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("pop edecek");

        return true;

      },
      child: Scaffold(
        appBar: AppBar(),

          body: Column(
            children: [

              Placeholder(
                fallbackHeight: 150,
                fallbackWidth: 75,
              ),

              Text(mesaj),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).maybePop(true);
                },
                child: Text("Evet"
                ),


              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).maybePop(false);
                },
                child: Text("Hayır "
                ),

              ),
            ],
          ),
      ),
    );
  }
}

class ogrEkle extends StatefulWidget {

  const ogrEkle({
    super.key,
  });

  @override
  State<ogrEkle> createState() => _ogrEkleState();
}

class _ogrEkleState extends State<ogrEkle> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sinifbilgisi = sinifBilgisi.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
        ),
        Align(
          alignment: Alignment.bottomRight ,
          child: ElevatedButton(
            onPressed: () {
              final yeniOgr = _controller.text;
              sinifbilgisi.yeniOgrEkle(yeniOgr);
              _controller.text = "";
            },
            child: Text('Ekle'),
          ),
        ),
      ],
    );
  }
}

class arkaPlan extends StatelessWidget {
  const arkaPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 175,
      color: Colors.deepOrange,
      child: Container(
        color: Colors.deepPurple,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 60,
            height: 100,
            color: Colors.amber,
            child: Text(
                'Merhoba',
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ),
    );
  }
}

class ogrList extends StatelessWidget {
  const ogrList({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final sinifbilgisi = sinifBilgisi.of(context);
    return Column(
      children: [
        for (final o in sinifbilgisi.ogrenciler)
          Text(o
          ),
      ],
    );
  }
}

class yaziYeri extends StatefulWidget {
  final String istenenYazi;

  const yaziYeri({super.key, required this.istenenYazi});

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

    if (oldWidget.istenenYazi != widget.istenenYazi) {
      controller.text = widget.istenenYazi;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        print(value);
      },
      decoration: InputDecoration(
          suffixIcon: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          controller.text = '';
        },
      )),
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

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Settings bar page"),
      ),
      body: Center(
        child: Text("Settings page "),
      ),

    );
  }
}
