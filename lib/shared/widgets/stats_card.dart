import 'dart:ffi';

import 'package:apanat_app/shared/models/stats_model.dart';
import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget{
  final StatsModel status;
  
  const StatsCard({
    super.key,
    required this.status
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: status.color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(status.icon, color: Colors.white, size: 20),
                SizedBox(width: 5,),
                Text(
                  status.titulo,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
            SizedBox(height: 24,),
            Text(
              "${status.total}${status.sufixo}",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w800
              ),
            ),
            SizedBox(height: 1,),
            Text(
              status.duracao,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w400
              ),
            )
          ],
        ),
      ),
    );
  }
}