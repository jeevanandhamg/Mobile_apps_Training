import 'package:flutter/material.dart';

class HourlyForeCastItem extends StatelessWidget {
  final String time;
  final String temperature;
  final Icon icon;
  const HourlyForeCastItem({
    super.key, 
    required this.time,
     required this.temperature, 
     required this.icon
    });

  @override
  Widget build(BuildContext context) {
    return Card(
                      elevation: 7,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child:  Column(
                          children: [
                            Text(time,style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,),
                            const SizedBox(height: 8,),
                            icon,
                            const SizedBox(height: 8,),
                            Text(temperature,style: const TextStyle(
                              
                            ),),
                          ],
                        ),
                      ),
                    );
  }
}