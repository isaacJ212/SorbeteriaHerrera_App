import 'package:flutter/material.dart';
import 'package:herrera_app/theme/app_colors.dart';
import '../../Widgets/bottom_navbar.dart';



class Accesshistory extends StatelessWidget {
  const Accesshistory({super.key});

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
            _buildAuditSumary(),
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

  //appBar consideracion para hacer un widget global/
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

  // filtrer date

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

  //audit
  Widget _buildAuditSumary() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFF95F1D0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.shield,
                  color: Color(0xFF00A86B),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Auditoria Operativa',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF95F1D0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, size: 6, color: Color(0xFF00A86B)),
                    SizedBox(width: 4),
                    Text(
                      'En linea',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF00A86B),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  label: 'Sesiones activas',
                  value: '2',
                  suffix: 'locales',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  label: 'Intentos fallidos',
                  value: '0',
                  suffix: 'Hoy',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  label: 'Ultimos Ingreso',
                  value: '10:00 PM',
                  isTime: true,
                  suffix: '',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //tarjeta individual
  Widget _buildSummaryCard({
    required String label,
    required String value,
    required String suffix,
    bool isTime = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(10), //siempre me da sal este padding
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: isTime ? 16 : 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                suffix,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //seecion del titulo

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

  //partes del las list de los accesos

  Widget _buildAccessLogsList() {
    return ListView.builder(
      shrinkWrap: true,// esta proieda es como el que pertmiten hacer scroll
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _accessLogs.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final log = _accessLogs[index];
        return _buildAccessLogCard(log);
      },

      
    );
  }

  Widget _buildAccessLogCard(Map<String, dynamic> log) {
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

          const SizedBox(height: 16,),
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
                  // 15min por una letra desgraciada
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

  Widget _buildStatusBadge(String status){
    Color bgColor;
    Color textColor;
    IconData icon;

    switch (status) {
      case 'Exitoso':
        bgColor =   Color(0xFF00A86B);
        textColor =  Color.fromARGB(255, 228, 230, 229);//clase caballada , con razon decia de que el texto no se miraba
        icon = Icons.check_circle;
        break;
      case 'Bloqueado':
        bgColor =  Color(0xFFE0E4E6);
        textColor = Color(0xFF8A9691);
        icon = Icons.block;
        break;
      case 'Aviso':
        bgColor =  Color(0xFFE0E4E6);
        textColor = Color(0xFF8A9691);
        icon = Icons.info;
        break;
      default:
        bgColor =  Color(0xFFE0E4E6);
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
  }){
    return Row(
      children: [
        Icon(icon,size: 16, color:AppColors.textSecondary ,),
        const SizedBox(width: 8,),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
          
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
        )
      ],
      //flutter me odia
    );

  }



}
