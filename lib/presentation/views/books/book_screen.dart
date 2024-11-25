import 'package:auto_route/auto_route.dart';
import 'package:boilerplate/core/constants/app_typography.dart';
import 'package:boilerplate/presentation/provider/bookprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class BookDetails extends StatelessWidget {
  final TextEditingController _isbnController = TextEditingController();

  BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fetch Book Details',
          style: AppTypography.typo20DarkBold,
        ),
        backgroundColor: Colors.blue.shade900,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _isbnController,
              decoration: const InputDecoration(
                labelText: 'Enter ISBN',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_isbnController.text.isNotEmpty) {
                  bookProvider.fetchBookDetails(_isbnController.text.trim());
                }
              },
              child: const Text('Fetch Details'),
            ),
            const SizedBox(height: 20),
            if (bookProvider.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (bookProvider.error != null)
              Text('Error: ${bookProvider.error}',
                  style: AppTypography.typo12ErrorRegular),
            if (bookProvider.bookDetails != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title: ${bookProvider.bookDetails!['title']}',
                        style: AppTypography.typo20DarkBold,
                      ),
                      const SizedBox(height: 10),
                      Text('Authors: ${bookProvider.bookDetails!['authors']}'),
                      const SizedBox(height: 10),
                      Text(
                          'Description: ${bookProvider.bookDetails!['description']}'),
                      const SizedBox(height: 10),
                      if (bookProvider.bookDetails!['thumbnail'] !=
                          'No image available')
                        Image.network(bookProvider.bookDetails!['thumbnail']),
                    ],
                  ),
                ),
              )
            else
              const Text('Enter ISBN to fetch book details.'),
          ],
        ),
      ),
    );
  }
}
