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
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsetsGeometry.fromLTRB(16, 16, 16, 0),
              child: Text(
                  'Inventario',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryText,
                  ),
                ),
            ),
            
            _buildSummaryCard(),
            _buildRiskProductSection(),
            const SizedBox(height: 20,)
          ],
        ),
      ),
      
      bottomNavigationBar: BottomNavbar(currentIndex: 3, onTap: (index) {}),
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

  
  Widget _buildSummaryCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Valor Total',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'C\$30,000',  /// en est pareet tuve que investigar para que el pantalla se me mostra el sigono de dolar
                  //ya que si lo ponia sig este signo \ pues no me interpretara que despues iba una variable
                  //era algo sencillo pero bueno
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
  
                  
                ),
              ],
            ),
          ),
          
          const SizedBox(width: 16), 


          Flexible(
            flex: 3, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Productos en Alerta',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF0F0),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFFBA1A1A).withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min, 
                    children: [
                      Text(
                        '3 Agotado',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFBA1A1A),
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.error_outline, size: 16, color: Color(0xFFBA1A1A)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRiskProductSection (){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsGeometry.fromLTRB(16, 24, 16, 12),
          child: const Text(
            'Productos en Riesgo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          
        ),
        _buildProductCard(
            productName: 'Helado de Hielo',
            size: '10 oz',
            currentStock: 4,
            maxStock: 30,
            badgeText: 'Stock Bajo'
          ),
          _buildProductCard(
          productName: 'Helado de mani',
          size: '4 oz',
          currentStock: 6,
          maxStock: 25,
          badgeText: 'Stock Bajo',
        ),
      ],
    );
  }



  Widget _buildProductCard({
    required String productName,
    required String size,
    required int currentStock,
    required int maxStock,
    required String badgeText,
  }){
    final stockPercentage = currentStock / maxStock;
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey,
          width: 1
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 4,
            offset: const Offset(0, 2)
          ),
        ]
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
                  color: Color(0xFFFFF9E6), 
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.inventory,
                  color: Color(0xFFE7D76A),
                  size: 24,
                ),
              ),
              SizedBox(width: 12,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary
                      ),
                    ),
                    const SizedBox(height: 2,),
                    Text(
                      size,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9E6),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text(
                  badgeText,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFB66A00)
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              const Text(
                'Stock Actual',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              Text(
                '$currentStock Unidades',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8,),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(4),
            child: LinearProgressIndicator(
              value: stockPercentage,
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFE7D76A)),
              minHeight: 6,
            ),
          )
        ],
      ),
      );
  }



}


