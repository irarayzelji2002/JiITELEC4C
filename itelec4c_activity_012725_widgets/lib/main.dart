import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itelec4c_activity_test/pages/registration_page.dart';

void main() {
  runApp(const MyApp());
}

final _firstName = TextEditingController();
final _lastName = TextEditingController();
final _address = TextEditingController();
final _workAddress = TextEditingController();
final _emailAddress = TextEditingController();
final _contactNumber = TextEditingController();

// MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final txtFieldSectionKey = GlobalKey<_TxtFieldSectionState>();

    return MaterialApp(
      title: 'Registration Module',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registration Module'),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              MyDrawerHeader(),
              Expanded(child: MyDrawerListView()),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImgSection(),
              TxtFieldSection(key: txtFieldSectionKey),
              BtnFieldSection(
                onSubmit: () =>
                    txtFieldSectionKey.currentState?.validateFields(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// MyDrawerHeader
class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({super.key});

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
class MyDrawerListView extends StatefulWidget {
  const MyDrawerListView({super.key});

  @override
  _MyDrawerListView createState() => _MyDrawerListView();
}

class _MyDrawerListView extends State<MyDrawerListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text("Main Page"),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistrationPage()),
              );
            },
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
                image: AssetImage('assets/bg_image.jpg'), fit: BoxFit.cover),
            shape: BoxShape.rectangle,
          ),
        ));
  }
}

// TxtFieldSection
class TxtFieldSection extends StatefulWidget {
  const TxtFieldSection({super.key});

  @override
  State<TxtFieldSection> createState() => _TxtFieldSectionState();
}

class _TxtFieldSectionState extends State<TxtFieldSection> {
  bool _validateFirstName = false;
  bool _validateLastName = false;
  bool _validateAddress = false;
  bool _validateWorkAddress = false;
  bool _validateEmailAddress = false;
  bool _validateContactNumber = false;

  void validateFields() {
    setState(() {
      _validateFirstName = _firstName.text.isEmpty;
      _validateLastName = _lastName.text.isEmpty;
      _validateAddress = _address.text.isEmpty;
      _validateWorkAddress = _workAddress.text.isEmpty;
      _validateEmailAddress = _emailAddress.text.isEmpty;
      _validateContactNumber = _contactNumber.text.isEmpty;
    });
  }

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
                  controller: _firstName,
                  inputFormatters: [LengthLimitingTextInputFormatter(100)],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                    errorText: _validateFirstName ? 'Field is required' : null,
                  ),
                ),
              ),
              SizedBox(width: 10), // Add spacing
              Expanded(
                child: TextField(
                  controller: _lastName,
                  inputFormatters: [LengthLimitingTextInputFormatter(100)],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                    errorText: _validateLastName ? 'Field is required' : null,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10), // Add spacing
          TextField(
            controller: _address,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Address',
              errorText: _validateAddress ? 'Field is required' : null,
            ),
          ),
          SizedBox(height: 10), // Add spacing
          TextField(
            controller: _workAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Work Address',
              errorText: _validateWorkAddress ? 'Field is required' : null,
            ),
          ),
          SizedBox(height: 10), // Add spacing
          TextField(
            controller: _emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email Address',
              errorText: _validateEmailAddress ? 'Field is required' : null,
            ),
          ),
          SizedBox(height: 10), // Add spacing
          TextField(
            controller: _contactNumber,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11)
            ],
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Contact Number',
              errorText: _validateContactNumber ? 'Field is required' : null,
            ),
          ),
        ],
      ),
    );
  }
}

// BtnFieldSection
class BtnFieldSection extends StatefulWidget {
  final VoidCallback onSubmit;

  const BtnFieldSection({super.key, required this.onSubmit});

  @override
  State<BtnFieldSection> createState() => _BtnFieldSectionState();
}

class _BtnFieldSectionState extends State<BtnFieldSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: widget.onSubmit, // Call validateFields()
              child: Text('Submit'),
            ),
          ),
        ],
      ),
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
