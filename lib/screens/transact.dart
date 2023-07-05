import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package for date formatting
import 'package:transact_app/json/transaction_data.dart';// Import the transaction data file



class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    String currentDate = '';
    transactions.sort((a, b) {
      final dateA = DateTime.parse(a['updated_at']);
      final dateB = DateTime.parse(b['updated_at']);
      return dateB.compareTo(dateA);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          // Access transaction attributes and create widgets to display the data
          final amount = transaction['amount'];
          final isCredit = transaction['is_credit'];
          final status = transaction['status'];
          final updatedAt = DateTime.parse(transaction['updated_at']);
          final formattedDate = DateFormat.yMd().format(updatedAt); // Format the date

          // Check if the current date is different from the previous transaction's date
          if (formattedDate != currentDate) {
            currentDate = formattedDate;
            return Column(
              children: [
                Divider(),
                ListTile(
                  title: Text(
                    'Date: $formattedDate',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text('Amount: $amount'),
                  subtitle: Text('Status: $status'),
                  trailing: isCredit ? Icon(Icons.add) : Icon(Icons.remove),
                ),
              ],
            );
          } else {
            return ListTile(
              title: Text('Amount: $amount'),
              subtitle: Text('Status: $status'),
              trailing: isCredit ? Icon(Icons.add) : Icon(Icons.remove),
            );
          }
        },
      ),
    );
  }
}


































// import 'package:flutter/material.dart';
// import 'package:transact_app/json/transaction_data.dart';
// import 'package:intl/intl.dart';
//
// class TransactPage extends StatefulWidget {
//   const TransactPage({Key? key}) : super(key: key);
//
//   transactions.sort((a, b) {
//   final dateA = DateTime.parse(a['updated_at']);
//   final dateB = DateTime.parse(b['updated_at']);
//   return dateB.compareTo(dateA);
//   });
//
//
//   @override
//   State<TransactPage> createState() => _TransactPageState();
// }
//
// class _TransactPageState extends State<TransactPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Transactions'),
//       ),
//       body: ListView.builder(
//         itemCount: transactions.length,
//         itemBuilder: (context, index) {
//           final transaction = transactions[index];
//           // Access transaction attributes and create widgets to display the data
//           final amount = transaction['amount'];
//           final isCredit = transaction['is_credit'];
//           final status = transaction['status'];
//           final updatedAt = DateTime.parse(transaction['updated_at']);
//           final formattedDate = DateFormat.yMd().format(updatedAt); // Format the date
//
//           return ListTile(
//             title: Text('Amount: $amount'),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Status: $status'),
//                 Text('Date: $formattedDate'), // Display the formatted date
//               ],
//             ),
//             trailing: isCredit ? Icon(Icons.add) : Icon(Icons.remove),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
