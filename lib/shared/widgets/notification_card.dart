import 'package:apanat_app/shared/models/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  
  const NotificationCard({
    super.key, 
    required this.notification,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: [
          Icon(
            Icons.notifications, 
            color: Color(0xFF208286),
          ),
          SizedBox(width: 5,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.nome,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800
                ),
              ),
              SizedBox(height: 5,),
              Text(
                notification.descricao,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Icon(Icons.calendar_month_outlined, size: 20, color: Colors.grey,),
                  SizedBox(width: 5,),
                  Text(
                    '${notification.data.day.toString().padLeft(2, '0')}/${notification.data.month.toString().padLeft(2, '0')}/${notification.data.year}',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 34, 34, 34),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 12,),
                  Icon(Icons.watch_later_outlined, size: 20, color: Colors.grey.shade700,),
                  SizedBox(width: 5,),
                  Text(
                    notification.horario,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 34, 34, 34),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}