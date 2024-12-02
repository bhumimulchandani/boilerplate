import 'package:boilerplate/core/constants/app_typography.dart';
import 'package:boilerplate/presentation/riverpod/book_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookDetails extends ConsumerWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookState = ref.watch(bookProvider);
    final bookNotifier = ref.read(bookProvider.notifier);
    final TextEditingController isbnController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade900,
        title: Text('Book Details', style: AppTypography.typo20DarkBold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: isbnController,
              decoration: const InputDecoration(
                labelText: 'Enter ISBN',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (isbnController.text.isNotEmpty) {
                  bookNotifier.fetchBookDetails(isbnController.text.trim());
                }
              },
              child: const Text('Fetch Details'),
            ),
            const SizedBox(height: 20),
            if (bookState.isLoading)
              const CircularProgressIndicator()
            else if (bookState.error != null)
              Text('Error: ${bookState.error}',
                  style: const TextStyle(color: Colors.red)),
            if (bookState.bookDetails != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title: ${bookState.bookDetails!['title']}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text('Authors: ${bookState.bookDetails!['authors']}'),
                      const SizedBox(height: 10),
                      Text(
                          'Description: ${bookState.bookDetails!['description']}'),
                      const SizedBox(height: 10),
                      if (bookState.bookDetails!['thumbnail'] != null)
                        Image.network(bookState.bookDetails!['thumbnail']),
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

// import 'package:auto_route/auto_route.dart';
// import 'package:boilerplate/core/constants/app_typography.dart';
// import 'package:boilerplate/presentation/provider/bookprovider.dart';
// import 'package:boilerplate/presentation/provider/language_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import for localization
// import 'package:provider/provider.dart';

// @RoutePage()
// class BookDetails extends StatelessWidget {
//   final TextEditingController _isbnController = TextEditingController();

//   BookDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final bookProvider = Provider.of<BookProvider>(context);
//     final languageProvider = Provider.of<LanguageProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           AppLocalizations.of(context)!
//               .fetchBookDetails, // Use localized string
//           style: AppTypography.typo20DarkBold,
//         ),
//         backgroundColor: Colors.blue.shade900,
//         automaticallyImplyLeading: false,
//         actions: [
//           DropdownButton<String>(
//             icon: Icon(Icons.language, color: Colors.white),
//             items: [
//               DropdownMenuItem(child: Text('English'), value: 'en'),
//               DropdownMenuItem(child: Text('हिंदी'), value: 'hi'),
//             ],
//             onChanged: (value) {
//               if (value != null) {
//                 languageProvider.changeLanguage(value); // Change language
//               }
//             },
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _isbnController,
//               decoration: InputDecoration(
//                 labelText:
//                     AppLocalizations.of(context)!.enterIsbn, // Localized string
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 if (_isbnController.text.isNotEmpty) {
//                   bookProvider.fetchBookDetails(_isbnController.text.trim());
//                 }
//               },
//               child: Text(AppLocalizations.of(context)!
//                   .fetchDetails), // Localized string
//             ),
//             const SizedBox(height: 20),
//             if (bookProvider.isLoading)
//               const Center(child: CircularProgressIndicator())
//             else if (bookProvider.error != null)
//               Text(
//                   '${AppLocalizations.of(context)!.error}: ${bookProvider.error}')
//             else if (bookProvider.bookDetails != null)
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                           '${AppLocalizations.of(context)!.title}: ${bookProvider.bookDetails!['title']}'),
//                       const SizedBox(height: 10),
//                       Text(
//                           '${AppLocalizations.of(context)!.authors}: ${bookProvider.bookDetails!['authors']}'),
//                       const SizedBox(height: 10),
//                       Text(
//                           '${AppLocalizations.of(context)!.description}: ${bookProvider.bookDetails!['description']}'),
//                       const SizedBox(height: 10),
//                       if (bookProvider.bookDetails!['thumbnail'] !=
//                           'No image available')
//                         Image.network(bookProvider.bookDetails!['thumbnail']),
//                     ],
//                   ),
//                 ),
//               )
//             else
//               Text(AppLocalizations.of(context)!.enterIsbnToFetchDetails),
//           ],
//         ),
//       ),
//     );
//   }
// }

