class OrderModel {
  final String id;
  final String orderIdDisplay; // e.g. '#1947034'
  final String date; // '05-12-2019'
  final String expectedDelivery; // '20 Mins'
  final int itemsCount;
  final double totalAmount;
  final String totalAmountDisplay; // 'Rs 1,500'
  final String status; // 'Ongoing', 'History', 'Delivered'
  final String restaurantName; // 'Uttora Coffee House'
  final String orderTime; // '06 Sept, 10:00pm'
  final List<String> summaryItems; // ['2x Burger', '4x Sanwitch']
  final int progressStep; // 0: received, 1: preparing, 2: picked up, 3: arriving soon

  OrderModel({
    required this.id,
    required this.orderIdDisplay,
    required this.date,
    required this.expectedDelivery,
    required this.itemsCount,
    required this.totalAmount,
    required this.totalAmountDisplay,
    required this.status,
    this.restaurantName = 'Uttora Coffee House',
    this.orderTime = '06 Sept, 10:00pm',
    this.summaryItems = const ['2x Burger', '4x Sanwitch'],
    this.progressStep = 1,
  });
}
