import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lyrical Geek'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: Text(
              widget.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
            backgroundColor: Colors.greenAccent,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ))
            ],
            bottom: AppBar(
              backgroundColor: Colors.greenAccent,
              title: Container(
                width: double.infinity,
                height: 40,
                color: const Color.fromRGBO(150, 241, 197, 1),
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search for Music, artist',
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
              ),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return ListTile(
              leading: Image.network('https://placekitten.com/640/360'),
              title: Text("Track $index") ,
              subtitle: Text("Track $index"),
              tileColor: Colors.blue[100 * (index % 9 + 1)],
              trailing: const Icon(Icons.play_circle),
            );
          }))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note,),
            label: 'Music'),
            BottomNavigationBarItem(
            icon: Icon(
              Icons.music_note,
            ),
            label: 'Lyrics'),
            BottomNavigationBarItem(
            icon: Icon(Icons.music_note,),
            label: 'More')
        ]),
    );
  }
}
