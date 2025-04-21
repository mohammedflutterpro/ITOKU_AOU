import 'package:flutter/material.dart';

class ContactTutorPage extends StatefulWidget {
  const ContactTutorPage({Key? key}) : super(key: key);

  @override
  State<ContactTutorPage> createState() => _ContactTutorPageState();
}

class _ContactTutorPageState extends State<ContactTutorPage> {
  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();

  void _sendMessage() {
    if (_formKey.currentState!.validate()) {
      // Fake send
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent to tutor!')),
      );
      _messageController.clear();
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
              'Our tutors are here to help you! Choose a contact method or send us a message directly below.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.email, color: Colors.teal),
              title: Text('tutor.mina@itoku.com'),
              subtitle: Text('Mina - Japanese Basics'),
            ),
            const ListTile(
              leading: Icon(Icons.email, color: Colors.teal),
              title: Text('tutor.john@itoku.com'),
              subtitle: Text('john - Conversation Practice'),
            ),
            const ListTile(
              leading: Icon(Icons.email, color: Colors.teal),
              title: Text('tutor.Sara@itoku.com'),
              subtitle: Text('Sara - Grammar and Writing'),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.phone, color: Colors.teal),
              title: Text('+966 534 567 8901'),
              subtitle: Text('Mina'),
            ),
            const ListTile(
              leading: Icon(Icons.phone, color: Colors.teal),
              title: Text('+966 534 567 8902'),
              subtitle: Text('john'),
            ),
            const ListTile(
              leading: Icon(Icons.phone, color: Colors.teal),
              title: Text('+966 534 567 8903'),
              subtitle: Text('Sara'),
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
                decoration: InputDecoration(
                  hintText: 'Write your message here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black)
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
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
                icon: const Icon(Icons.send,color: Colors.white,),
                label: const Text('Send Message',style: TextStyle(color: Colors.white),),
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
