import 'package:flutter/material.dart';
import 'package:herrera_app/theme/app_colors.dart';
import '../../Widgets/bottom_navbar.dart';


class ReporteDeInventarioScreen extends StatelessWidget {
  const ReporteDeInventarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCardAlerts(),
            
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
        'Reporte de Inventario',
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

  Widget _buildCardAlerts() {
    return Row(
      children: [
        Container(
          color: const Color.fromARGB(255, 218, 6, 6),

        )
      ],
    );
  }



}


