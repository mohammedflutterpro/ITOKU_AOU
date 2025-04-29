import 'package:flutter/material.dart';

class ContactTutorPage extends StatefulWidget {
  const ContactTutorPage({Key? key}) : super(key: key);

  @override
  State<ContactTutorPage> createState() => _ContactTutorPageState();
}

class _ContactTutorPageState extends State<ContactTutorPage> {
  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();
  String? _selectedEmail; // Tracks the selected email

  void _sendMessage() {
    if (_formKey.currentState!.validate()) {
      if (_selectedEmail == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a tutor email!')),
        );
        return;
      }
      // Fake send
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Message sent to $_selectedEmail!')),
      );
      _messageController.clear();
      setState(() {
        _selectedEmail = null; // Reset selection after sending
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Tutor'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Need Help? Contact a Tutor!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Our tutors are here to help you! Choose a tutor by selecting their email and send a message directly below.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.teal),
              title: const Text('tutor.mina@itoku.com'),
              subtitle: const Text('Mina - Japanese Basics'),
              trailing: Checkbox(
                value: _selectedEmail == 'tutor.mina@itoku.com',
                onChanged: (bool? value) {
                  setState(() {
                    _selectedEmail = value == true ? 'tutor.mina@itoku.com' : null;
                  });
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.teal),
              title: const Text('tutor.john@itoku.com'),
              subtitle: const Text('John - Conversation Practice'),
              trailing: Checkbox(
                value: _selectedEmail == 'tutor.john@itoku.com',
                onChanged: (bool? value) {
                  setState(() {
                    _selectedEmail = value == true ? 'tutor.john@itoku.com' : null;
                  });
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.teal),
              title: const Text('tutor.sara@itoku.com'),
              subtitle: const Text('Sara - Grammar and Writing'),
              trailing: Checkbox(
                value: _selectedEmail == 'tutor.sara@itoku.com',
                onChanged: (bool? value) {
                  setState(() {
                    _selectedEmail = value == true ? 'tutor.sara@itoku.com' : null;
                  });
                },
              ),
            ),
            const Divider(),
            const SizedBox(height: 20),
            const Text(
              '📩 Send a Message:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _messageController,
                maxLines: 4,
                enabled: _selectedEmail != null, // Disable if no email selected
                decoration: InputDecoration(
                  hintText: _selectedEmail == null
                      ? 'Select a tutor email to enable typing...'
                      : 'Write your message here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  filled: true,
                  fillColor: _selectedEmail == null ? Colors.grey[300] : Colors.grey[100],
                  hintStyle: TextStyle(
                    color: _selectedEmail == null ? Colors.grey[600] : Colors.grey,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton.icon(
                onPressed: _sendMessage,
                icon: const Icon(Icons.send, color: Colors.white),
                label: const Text('Send Message', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tutors are available from 9 AM to 5 PM (UTC).',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}