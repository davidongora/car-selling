import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _residencyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = 'John Doe';
    _ageController.text = '20';
    _dobController.text = '01/01/2004';
    _residencyController.text = 'Nairobi, Kenya';
  }

  void _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      setState(() {
        _dobController.text = '${pickedDate.toLocal()}'.split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.amber[300],
              // backgroundImage: const AssetImage('assets/logo.jpeg'),
              child: const Icon(
                Icons.person_3,
                size: 60,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 10,
              color: Colors.amber,
            ),
            ListTile(
              title: const Text(
                'Name',
              ),
              subtitle: Text(
                _nameController.text,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              // subtitle: TextFormField(
              //   controller: _nameController,
              //   decoration: const InputDecoration(hintText: 'Enter your name'),
              // ),
            ),
            ListTile(
              title: const Text('Age'),
              subtitle: TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(hintText: 'Enter your age'),
                keyboardType: TextInputType.number,
              ),
            ),
            ListTile(
                title: const Text('Date of Birth'),
                subtitle: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Text(
                    _dobController.text,
                    style: const TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                )
                // subtitle: TextFormField(
                //   controller: _dobController,
                //   decoration:
                //       const InputDecoration(hintText: 'Enter your date of birth'),
                //   keyboardType: TextInputType.datetime,
                //   onTap: () => {'Not Editable'},
                // ),
                ),
            ListTile(
              title: const Text('Residency'),
              subtitle: TextFormField(
                controller: _residencyController,
                decoration:
                    const InputDecoration(hintText: 'Enter your residency'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle save action
                String name = _nameController.text;
                String age = _ageController.text;
                String dob = _dobController.text;
                String residency = _residencyController.text;

                // Do something with the data
                print(
                    'Name: $name, Age: $age, DOB: $dob, Residency: $residency');
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
