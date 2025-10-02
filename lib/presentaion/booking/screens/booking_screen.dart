import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon_app/core/config/widgets/custom_appbar_wdt.dart';
import 'package:salon_app/core/config/widgets/custom_container_wdt.dart';
import 'package:salon_app/presentaion/booking/screens/cancel_booking_screen.dart';
import 'package:salon_app/presentaion/details/widgets/filter_chip.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  List<String> filterOptions = ['UpComing', 'Completed', 'Cancelled'];
  String selectedFilter = 'UpComing';
  List<Map<String, dynamic>> appointments = List.generate(
    10,
    (index) => {
      'id': index,
      'date': 'March 15, 2024',
      'time': '10:30 AM',
      'status': index % 3 == 0
          ? 'UpComing'
          : (index % 3 == 1 ? 'Completed' : 'Cancelled'),
      'isAccepted': false,
      'image': 'https://picsum.photos/80/80?random=$index',
      'service': 'Classic Haircut',
      'stylist': 'John Doe',
      'price': 30.00,
    },
  );

  void _toggleAppointmentStatus(Map<String, dynamic> appointment) {
    setState(() {
      final index = appointments.indexWhere(
        (a) => a['id'] == appointment['id'],
      );
      if (index != -1) {
        appointments[index]['isAccepted'] = !appointments[index]['isAccepted'];
      }
    });
  }

  void _viewReceipt() {
    // TODO: Implement receipt viewing logic
  }

  void _cancelBooking() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Cancel Booking',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Divider(height: 1),
         const SizedBox(height: 20),
              const Text(
                'Are you sure you want to cancel this booking? This action cannot be undone.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('No, Keep it'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CancelBookingScreen(),
                          ),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('Yes, Cancel'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  late List<Map<String, dynamic>> filteredAppointments;

  @override
  Widget build(BuildContext context) {
    filteredAppointments = appointments
        .where((appointment) => appointment['status'] == selectedFilter)
        .toList();

    return Scaffold(
    appBar: IOSAppBar(
        title: const Text('Book Appointment'),
        context: context,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainerWdt(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
              height: 60,
              child: ListView.builder(
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemCount: filterOptions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: CustomFilterChip(
                      width: 74,
                      label: filterOptions[index],
                      isSelected: selectedFilter == filterOptions[index],
                      onSelected: (selected) {
                        setState(() {
                          selectedFilter = filterOptions[index];
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredAppointments.length,
              itemBuilder: (context, index) {
                final appointment = filteredAppointments[index];
                return CustomContainerWdt(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
              
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    appointment['date'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    " - ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    appointment['time'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (appointment['status'] == 'UpComing')
                              Row(
                                children: [
                                  Text(
                                    "Remind me",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  CupertinoSwitch(
                                    value: appointment['isAccepted'],
                                    onChanged: (value) {
                                      // Remind me to handle appointment status
                                      _toggleAppointmentStatus(appointment);
                                    },
                                    trackColor: Colors.grey[300],
                                    activeColor: Theme.of(context).primaryColor,
                                  ),
                                ],
                              )
                            else
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: appointment['status'] == 'Completed'
                                      ? Colors.green.withOpacity(0.1)
                                      : Colors.red.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  appointment['status'],
                                  style: TextStyle(
                                    color: appointment['status'] == 'Completed'
                                        ? Colors.green
                                        : Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      CustomContainerWdt(
                        height: 1,
                        width: 300,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                appointment['image'],
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: Center(
                                      child: Icon(Icons.error_sharp),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    appointment['service'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'with ${appointment['stylist']}',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '\$${appointment['price'].toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (appointment['status'] == 'Completed' ||
                          appointment['status'] == 'UpComing')
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _viewReceipt,

                                  label: const Text(
                                    'View E-Receipt',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Theme.of(
                                      context,
                                    ).primaryColor,
                                    elevation: 2,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (appointment['status'] == 'UpComing')
                                const SizedBox(width: 8),
                              if (appointment['status'] == 'UpComing')
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: _cancelBooking,

                                    label: const Text(
                                      'Cancel Booking',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                      foregroundColor: Colors.white,
                                      elevation: 0,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                          color: Colors.orange.shade600,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
