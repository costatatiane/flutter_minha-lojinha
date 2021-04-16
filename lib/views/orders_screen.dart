import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/app_drawer.dart';

import '../providers/orders.dart';
import '../widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus pedidos'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).loadOrders(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return Center(child: Text('Ocorreu um erro inesperado'));
          } else {
            Consumer<Orders>(
              builder: (ctx, orders, child) {
                return ListView.builder(
                  itemBuilder: (ctx, i) => OrderWidget(orders.items[i]),
                  itemCount: orders.itemsCount,
                );
              },
            );
          }
        },
      ),
    );
  }
}
