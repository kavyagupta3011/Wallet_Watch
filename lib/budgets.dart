import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'add_budget_page.dart';

class Budgets extends StatefulWidget {
  const Budgets({super.key});

  @override
  State<Budgets> createState() => _BudgetsState();
}

class _BudgetsState extends State<Budgets> {
  String? userId;

  @override
  void initState() {
    super.initState();
    final currentUser = FirebaseAuth.instance.currentUser;
    userId = currentUser?.uid;
  }

  Future<void> _allocateFunds(String budgetId, double amount, String type) async {
    final budgetRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('budgets')
        .doc(budgetId);

    try {
      final budgetSnapshot = await budgetRef.get();
      if (!budgetSnapshot.exists) return;

      final data = budgetSnapshot.data() ?? {};

      // Fallback to default values if fields are missing
      double currentAmount = type == 'expense'
          ? (data['spending'] ?? 0.0) as double
          : (data['allocation'] ?? 0.0) as double;

      currentAmount += amount;

      await budgetRef.update(
        type == 'expense'
            ? {'spending': currentAmount}
            : {'allocation': currentAmount},
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Funds allocated successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userId == null) {
      return const Center(
        child: Text('User not logged in.'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Budgets'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Expense Budget Section
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(userId)
                    .collection('budgets')
                    .where('type', isEqualTo: 'expense')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No expense budgets added.'));
                  }

                  final budgets = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: budgets.length,
                    itemBuilder: (context, index) {
                      final budget = budgets[index];
                      final budgetId = budget.id;
                      final data = budget.data() as Map<String, dynamic>;
                      final name = data['name'] ?? 'Unnamed';
                      final amount = (data['amount'] ?? 0.0) as double;
                      final spending = (data['spending'] ?? 0.0) as double;
                      final timeline = data['timeline'] ?? 'No timeline';

                      return BudgetItem(
                        name: name,
                        amount: amount,
                        progress: spending / amount,
                        timeline: timeline,
                        onAllocate: (amount) {
                          _allocateFunds(budgetId, amount, 'expense');
                        },
                      );
                    },
                  );
                },
              ),
            ),

            // Savings Budget Section
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(userId)
                    .collection('budgets')
                    .where('type', isEqualTo: 'savings')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No savings budgets added.'));
                  }

                  final budgets = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: budgets.length,
                    itemBuilder: (context, index) {
                      final budget = budgets[index];
                      final budgetId = budget.id;
                      final data = budget.data() as Map<String, dynamic>;
                      final name = data['name'] ?? 'Unnamed';
                      final amount = (data['amount'] ?? 0.0) as double;
                      final allocation = (data['allocation'] ?? 0.0) as double;
                      final timeline = data['timeline'] ?? 'No timeline';

                      return BudgetItem(
                        name: name,
                        amount: amount,
                        progress: allocation / amount,
                        timeline: timeline,
                        onAllocate: (amount) {
                          _allocateFunds(budgetId, amount, 'savings');
                        },
                      );
                    },
                  );
                },
              ),
            ),

            // "Add Budget" button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddBudgetPage()),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add, color: Colors.white, size: 30),
                    SizedBox(width: 10),
                    Text(
                      "Add Budget",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BudgetItem extends StatelessWidget {
  final String name;
  final double amount;
  final double progress;
  final String timeline;
  final void Function(double) onAllocate;

  const BudgetItem({
    super.key,
    required this.name,
    required this.amount,
    required this.progress,
    required this.timeline,
    required this.onAllocate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: ListTile(
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Timeline: $timeline'),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
            ),
            const SizedBox(height: 8),
            Text('Progress: \$${(progress * amount).toStringAsFixed(2)} of \$${amount.toStringAsFixed(2)}'),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Allocate Funds'),
                      content: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Amount to allocate',
                        ),
                        onSubmitted: (value) {
                          double allocatedAmount = double.tryParse(value) ?? 0.0;
                          if (allocatedAmount > 0) {
                            onAllocate(allocatedAmount);
                          }
                          Navigator.pop(context); // Close dialog
                        },
                      ),
                    );
                  },
                );
              },
              child: const Text('Allocate Funds'),
            ),
          ],
        ),
      ),
    );
  }
}
