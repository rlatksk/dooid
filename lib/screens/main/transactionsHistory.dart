import 'package:dooid/data/accounts.dart';
import 'package:dooid/screens/main/home.dart';
import 'package:dooid/widgets/shortcuts/format.dart';
import 'package:dooid/widgets/shortcuts/initials.dart';
import 'package:flutter/material.dart';
import 'package:dooid/widgets/colors.dart';
import 'package:dooid/widgets/shortcuts/wBackButton.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionsHistory extends StatefulWidget {
  final Contact foundContact;

  const TransactionsHistory({Key? key, required this.foundContact})
      : super(key: key);

  @override
  _TransactionsHistoryState createState() => _TransactionsHistoryState();
}

class _TransactionsHistoryState extends State<TransactionsHistory> {
  late List<String> months;
  late List<String> orderedMonths;

  @override
  void initState() {
    super.initState();
    months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];

    // Calculate the dynamically ordered list of months
    int currentMonthIndex = DateTime.now().month - 1;
    orderedMonths = _calculateOrderedMonths(currentMonthIndex);
    selectedMonth = months[currentMonthIndex]; // Set initial selected month
  }

  List<String> _calculateOrderedMonths(int currentMonthIndex) {
    List<String> orderedMonths = [];
    for (int i = 0; i < 12; i++) {
      int monthIndex = (currentMonthIndex + 12 - i) % 12;
      orderedMonths.add(months[monthIndex]);
    }
    return orderedMonths;
  }

  String selectedMonth = ''; // Track the selected month

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          'Transactions',
          style: GoogleFonts.montserrat(
            fontSize: 28,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const wBackButton(),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      floatingActionButton: HomeQRScanButton(foundContact: widget.foundContact),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: HomeNavBar(
        foundContact: widget.foundContact,
        activeScreen: 'transactions',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Container(
                height: 40,
                child: Row(
                  children: orderedMonths.reversed
                      .map(
                        (month) => MonthButton(
                          month: month,
                          onTap: () {
                            setState(() {
                              selectedMonth = month;
                            });
                          },
                          isSelected: month == selectedMonth,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                reverse: false,
                itemCount: widget.foundContact.transactions?.length ?? 0,
                itemBuilder: (context, index) {
                  Transaction transaction =
                      widget.foundContact.transactions![index];

                  // Filter transactions for the selected month
                  if (transaction.date.month !=
                      months.indexOf(selectedMonth) + 1) {
                    return SizedBox.shrink();
                  }

                  return buildTransactionWidget(transaction);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionWidget(Transaction transaction) {
    Widget insideWidget;
    Color circleColor = Colors.white;
    Color strokeColor = AppColors.lightGrey;

    if (transaction.type == 'topup') {
      insideWidget = Image.asset(
        'assets/images/home/topup.png',
        width: 30,
        height: 30,
      );
    } else {
      insideWidget = Text(
        getInitials(transaction.name),
        style: GoogleFonts.montserrat(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                HomeCircleButtonIconText(
                  width: 65,
                  height: 65,
                  circleColor: circleColor,
                  strokeColor: strokeColor,
                  strokeSize: 2,
                  insideWidget: insideWidget,
                ),
                SizedBox(width: 8),
                Container(
                  height: 30,
                  width: 140,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.name.toUpperCase(),
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          transaction.message ?? '',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            color: AppColors.midGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 35,
              width: 120,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(
                          transaction.amount >= 0
                              ? Icons.add_circle
                              : Icons.remove_circle,
                          size: 15,
                          color: transaction.amount >= 0
                              ? AppColors.black
                              : AppColors.red,
                        ),
                        SizedBox(width: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'RP',
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: transaction.amount >= 0
                                    ? AppColors.black
                                    : AppColors.red,
                              ),
                            ),
                            Text(
                              formatBalance(transaction.amount.abs()),
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: transaction.amount >= 0
                                    ? AppColors.black
                                    : AppColors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      transaction.date.toString(),
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: AppColors.midGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class MonthButton extends StatelessWidget {
  final String month;
  final VoidCallback onTap;
  final bool isSelected;

  const MonthButton({
    Key? key,
    required this.month,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 100.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            foregroundColor: isSelected ? Colors.white : AppColors.black,
            backgroundColor: isSelected ? AppColors.black : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(
            month,
            style: GoogleFonts.montserrat(
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
