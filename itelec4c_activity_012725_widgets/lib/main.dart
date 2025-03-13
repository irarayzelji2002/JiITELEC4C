import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itelec4c_activity_test/pages/counter_page.dart';

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
            title: Text("Home (Registration)"),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),
          ListTile(
            title: Text("Counter Page"),
            leading: Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CounterPage()),
              );
            },
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
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Button with Icon'),
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
