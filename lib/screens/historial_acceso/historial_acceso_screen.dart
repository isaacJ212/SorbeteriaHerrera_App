import 'package:flutter/material.dart';
import 'package:herrera_app/theme/app_colors.dart';
import '../../widgets/bottom_navbar.dart';
import 'widgets/resumen_auditoria.dart';
import 'widgets/tarjeta_registro_acceso.dart';

class HistorialAccesoScreen extends StatelessWidget {
  const HistorialAccesoScreen({super.key});

  static const List<Map<String, dynamic>> _accessLogs = [
    {
      'userName': 'Carlos Ruiz',
      'userRole': 'Cajero',
      'userInitials': 'CR',
      'action': 'Apertura de turno / caja',
      'status': 'Aviso',
      'device': 'POS Mostrador 1',
      'ipAddress': '192.168.1.45',
      'dateTime': 'Hoy, 08:00 AM',
      'avatarColor': const Color(0xFFC5D4F5),
    },
    {
      'userName': 'Carlos Ruiz',
      'userRole': 'Cajero',
      'userInitials': 'CR',
      'action': 'Apertura de turno / caja',
      'status': 'Exitoso',
      'device': 'POS Mostrador 1',
      'ipAddress': '192.168.1.45',
      'dateTime': 'Hoy, 08:00 AM',
      'avatarColor': const Color(0xFFC5D4F5),
    },
    {
      'userName': 'Carlos Ruiz',
      'userRole': 'Cajero',
      'userInitials': 'CR',
      'action': 'Apertura de turno / caja',
      'status': 'Aviso',
      'device': 'POS Mostrador 1',
      'ipAddress': '192.168.1.45',
      'dateTime': 'Hoy, 08:00 AM',
      'avatarColor': const Color(0xFFC5D4F5),
    },
    {
      'userName': 'Juan Sánchez',
      'userRole': 'Admin',
      'userInitials': 'JS',
      'action': 'Inicio de sesión exitoso',
      'status': 'Exitoso',
      'device': 'Samsung S23 · App v2.4',
      'ipAddress': '190.212.44.12',
      'dateTime': 'Hoy, 10:30 AM',
      'avatarColor': const Color(0xFFA6F2D1),
    },
    {
      'userName': 'Juan Sánchez',
      'userRole': 'Admin',
      'userInitials': 'JS',
      'action': 'Inicio de sesión exitoso',
      'status': 'Bloqueado',
      'device': 'Samsung S23 · App v2.4',
      'ipAddress': '190.212.44.12',
      'dateTime': 'Hoy, 10:30 AM',
      'avatarColor': const Color(0xFFA6F2D1),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateFiltrer(),
            const ResumenAuditoria(),
            _buildSectionTitle('Inicios de Sesion'),
            _buildSectionTitle(
              'Bitacoras Cronologicas',
              subtitle: '5 registros recientes',
            ),
            _buildAccessLogsList(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(currentIndex: 4, onTap: (index) {}),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.primaryText),
        onPressed: () {},
      ),
      title: const Text(
        'Historial de Acceso',
        style: TextStyle(
          fontSize: 20,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: AppColors.primaryText),
          onPressed: () {},
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list, color: AppColors.primaryText),
        ),
      ],
    );
  }

  Widget _buildDateFiltrer() {
    return Padding(
      padding: const EdgeInsetsGeometry.all(16),
      child: Align(
        alignment: AlignmentGeometry.centerRight,
        child: TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.calendar_today, color: AppColors.primary),
          label: const Text(
            'Filtrar Fecha',
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.w500,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: AppColors.cardBackground,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, {String? subtitle}) {
    return Padding(
      padding: const EdgeInsetsGeometry.fromLTRB(20, 24, 20, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
              letterSpacing: 0.5,
            ),
          ),
          if (subtitle != null)
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAccessLogsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _accessLogs.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final log = _accessLogs[index];
        return TarjetaRegistroAcceso(log: log);
      },
    );
  }
}
