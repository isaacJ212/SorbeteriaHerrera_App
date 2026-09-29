import 'package:flutter/material.dart';
import 'package:herrera_app/theme/app_colors.dart';

class TarjetaRegistroAcceso extends StatelessWidget {
  final Map<String, dynamic> log;

  const TarjetaRegistroAcceso({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xFFA6F2D1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    log['userInitials'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          log['userName'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),
                        if ((log['userRole'] ?? '').toString().isNotEmpty) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE7EEFF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              log['userRole'],
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF4A6FA9),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      log['action'].toString(),
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              _buildStatusBadge(log['status']),
            ],
          ),

          const SizedBox(height: 16),
          //detalles de acceso
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _buildDetailRow(
                  icon: Icons.phone_android,
                  label: 'Dispositivo',
                  value: log['device'],
                ),
                if (log['ipAddress'] != null) ...[
                  const SizedBox(height: 8),
                  _buildDetailRow(
                    icon: Icons.dns,
                    label: 'IP',
                    value: log['ipAddress']!,
                  ),
                ],
                const SizedBox(height: 8),
                _buildDetailRow(
                  icon: Icons.access_time,
                  label: 'Fecha',
                  value: log['dateTime'],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color bgColor;
    Color textColor;
    IconData icon;

    switch (status) {
      case 'Exitoso':
        bgColor = Color(0xFF00A86B);
        textColor = Color.fromARGB(
          255,
          228,
          230,
          229,
        ); 
        icon = Icons.check_circle;
        break;
      case 'Bloqueado':
        bgColor = Color(0xFFE0E4E6);
        textColor = Color(0xFF8A9691);
        icon = Icons.block;
        break;
      case 'Aviso':
        bgColor = Color(0xFFE0E4E6);
        textColor = Color(0xFF8A9691);
        icon = Icons.info;
        break;
      default:
        bgColor = Color(0xFFE0E4E6);
        textColor = Color(0xFF8A9691);
        icon = Icons.info;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: textColor),
          const SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
        ),
      ],

    );
  }
}
