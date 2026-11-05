import 'package:flutter_test/flutter_test.dart';
import 'package:herrera_app/data/models/Detalle_Inventario_models/detalle_inventario_models.dart';
import 'package:herrera_app/data/models/inventario_models/inventario_models.dart';
import 'package:herrera_app/data/models/reporte_inventario/reporte_inventario_models.dart';

void main() {
  test('mapea listado y detalle de inventario', () {
    final producto = InventarioResponseGeneralModels.fromJson({
      'productId': 7,
      'productName': 'Sorbete',
      'lineName': 'Helados',
      'presentationName': 'Vaso',
      'flavorName': 'Vainilla',
      'totalStock': 12,
      'retailPrice': 35,
    });
    final detalle = DetalleInventarioModel.fromJson({
      'productId': 7,
      'productName': 'Sorbete',
      'lineName': 'Helados',
      'presentationName': 'Vaso',
      'flavorName': 'Vainilla',
      'retailPrice': 35,
      'totalStock': 12,
      'availableForSale': 10,
      'minimumStock': 5,
      'activeBatchCount': 1,
      'batches': [
        {
          'batchCode': 'L-1',
          'entryDate': '2026-10-01T00:00:00',
          'expirationDate': '2026-12-01',
          'totalCurrentStock': 12,
        },
      ],
    });

    expect(producto.retailPrice, 35.0);
    expect(detalle.lotes.single.batchCode, 'L-1');
  });

  test('mapea las métricas secundarias de inventario', () {
    final reporte = ReporteInventarioModel.fromJson({
      'totalProducts': 10,
      'lowStockProducts': 3,
      'inventoryValue': 1500,
      'bestSellingFlavor': {
        'flavorName': 'Chocolate',
        'quantitySold': 8,
        'period': 'month',
      },
      'productsInRisk': <dynamic>[],
    });

    expect(reporte.lowStockProducts, 3);
    expect(reporte.bestSellingFlavor?.flavorName, 'Chocolate');
  });
}
