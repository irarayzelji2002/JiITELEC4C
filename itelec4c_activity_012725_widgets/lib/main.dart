import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Module',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registration Module'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImgSection(),
              TxtFieldSection(),
              BtnFieldSection(),
            ],
          )
        ),
        drawer: Drawer(
          child: Column(
            children: [
              MyDrawerHeader(),
              Expanded( // Wrap MyDrawerListView in Expanded
                child: MyDrawerListView(),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

// MyDrawerHeader
class MyDrawerHeader extends StatefulWidget{
  @override
  _MyDrawerHeader createState() => _MyDrawerHeader();
}

class _MyDrawerHeader extends State<MyDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center content
        crossAxisAlignment: CrossAxisAlignment.center, // Align center
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/bg_image.jpg'),
            radius: 40,
          ), // Add spacing
          SizedBox(
            width: double.infinity, // Allow flexible width
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Hello World!', textAlign: TextAlign.center),
              ),
            ),
          ),
          Flexible(
            child: Text(
              "Ira Rayzel S. Ji",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}

// MyDrawerListView
class MyDrawerListView extends StatefulWidget{
  @override
  _MyDrawerListView createState() => _MyDrawerListView();
}

class _MyDrawerListView extends State<MyDrawerListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.zero,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text("Main Page"),
            leading: Icon(Icons.home),
            // onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => registration_page()),
            onTap: null,
          ),
          ListTile(
            title: Text("Main Page 1"),
            leading: Icon(Icons.app_registration),
            onTap: null,
          ),
          ListTile(
            title: Text("Main Page 2"),
            leading: Icon(Icons.question_mark),
            onTap: null,
          ),
        ],
      ),
    );
  }
}

// ImgSection
class ImgSection extends StatelessWidget {
  const ImgSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Container(
        height: 200.0,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg_image.jpg'),
            fit: BoxFit.cover
          ),
          shape: BoxShape.rectangle,
        ),
      )
    );
  }
}

// TxtFieldSection
class TxtFieldSection extends StatelessWidget {
  const TxtFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                    hintText: 'First Name',
                    hintMaxLines: 2,
                    hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink)
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                      hintText: 'Last Name',
                      hintMaxLines: 2,
                      hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent)
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Address',
                hintText: 'Address',
                hintMaxLines: 2,
                hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)
              ),
            )
          ),
          Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Work Address',
                    hintText: 'Work Address',
                    hintMaxLines: 2,
                    hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email Address',
                    hintText: 'Email Address',
                    hintMaxLines: 2,
                    hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contact Number',
                    hintText: 'Contact Number',
                    hintMaxLines: 2,
                    hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)
                ),
              )
          )
        ],
      ),
    );
  }
}

// BtnFieldSection
class BtnFieldSection extends StatelessWidget{
  const BtnFieldSection({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: ElevatedButton(onPressed: null, child: Text('Disabled'))),
          Expanded(child: ElevatedButton(onPressed: () {}, child: Text('Enabled'))),
          Expanded(child: ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.add, color: Colors.red), label: Text('Enable with Icon'))),
        ],
      )
    );
  }
}

// MyHomePage (template code)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
