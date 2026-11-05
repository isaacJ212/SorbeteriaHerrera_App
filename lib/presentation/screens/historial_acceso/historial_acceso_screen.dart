import 'package:flutter/material.dart';
import 'package:herrera_app/data/models/historial_acceso_models/historial_models.dart';
import 'package:herrera_app/presentation/providers/historial_acceso_provider.dart';
import 'package:herrera_app/presentation/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../../widgets/app_bar.dart';
import 'widgets/resumen_auditoria.dart';
import 'widgets/tarjeta_registro_acceso.dart';

class HistorialAccesoScreen extends StatefulWidget {
  const HistorialAccesoScreen({super.key});

  @override
  State<HistorialAccesoScreen> createState() => _HistorialAccesoScreenState();
}

class _HistorialAccesoScreenState extends State<HistorialAccesoScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HistorialAccesoProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (provider.errorMessage != null) {
          return Scaffold(
            appBar: const AppAppBar(
              title: 'Historial de Acceso',
              showBackButton: true,
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(provider.errorMessage!),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: provider.cargarHistorial,
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            ),
          );
        }

        final historial = provider.historial;
        if (historial == null) {
          return const Scaffold(
            appBar: AppAppBar(
              title: 'Historial de Acceso',
              showBackButton: true,
            ),
            body: Center(child: Text('No hay datos del historial disponibles')),
          );
        }

        return _buildContent(historial);
      },
    );
  }

  Widget _buildContent(HistorialAccesoResponse historial) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(
        title: 'Historial de Acceso',
        showBackButton: true,
        actions: [
          IconButton(
            tooltip: 'Buscar registro',
            icon: const Icon(
              Icons.search,
              color: AppColors.primaryText,
              size: 22,
            ),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Filtrar registros',
            onPressed: () {},
            icon: const Icon(
              Icons.filter_list,
              color: AppColors.primaryText,
              size: 22,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateFiltrer(),
            ResumenAuditoria(stats: historial.stats),
            _buildSectionTitle('Inicios de Sesion'),
            _buildSectionTitle(
              'Bitacoras Cronologicas',
              subtitle: '${historial.history.length} registros',
            ),
            _buildAccessLogsList(historial.history),
            const SizedBox(height: 20),
          ],
        ),
      ),
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

  Widget _buildAccessLogsList(List<HistorialAccesoItem> items) {
    if (items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(child: Text('No hay registros de acceso.')),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return TarjetaRegistroAcceso(item: items[index]);
      },
    );
  }
}
