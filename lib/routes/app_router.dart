import 'package:flutter/material.dart';

import '../screens/dashboard/dashboard_screen.dart';
import '../screens/detalle_producto/detalle_producto_screen.dart';
import '../screens/detalle_usuario/detalle_usuario_screen.dart';
import '../screens/detalle_venta/detalle_venta_screen.dart';
import '../screens/historial_acceso/historial_acceso_screen.dart';
import '../screens/inventario/inventario_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/mi_cuenta/mi_cuenta_screen.dart';
import '../screens/not_found/not_found_screen.dart';
import '../screens/pedido/pedido_screen.dart';
import '../screens/reporte_inventario/reporte_inventario_screen.dart';
import '../screens/reportes/reporte_screen.dart';
import '../screens/usuario/usuario_screen.dart';
import '../screens/ventas/venta_screen.dart';
import 'app_routes.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      case AppRoutes.inventario:
        return MaterialPageRoute(builder: (_) => const InventarioScreen());

      case AppRoutes.reportes:
        return MaterialPageRoute(builder: (_) => const ReportesScreen());

      case AppRoutes.detalleProducto:
        final datos = settings.arguments as Map<String, String>?;
        return MaterialPageRoute(
          builder: (_) => DetalleDeProductoScreen(
            nombre: datos?['nombre'] ?? 'Producto',
            stock: datos?['stock'] ?? '0',
            precio: datos?['precio'] ?? 'C\$ 0',
          ),
        );

      case AppRoutes.detalleVenta:
        return MaterialPageRoute(builder: (_) => const DetalleDeVentaScreen());

      case AppRoutes.reporteInventario:
        return MaterialPageRoute(
          builder: (_) => const ReporteDeInventarioScreen(),
        );

      case AppRoutes.historialAcceso:
        return MaterialPageRoute(builder: (_) => const HistorialAccesoScreen());

      case AppRoutes.miCuenta:
        return MaterialPageRoute(builder: (_) => const MiCuentaScreen());

      case AppRoutes.detalleUsuario:
        return MaterialPageRoute(builder: (_) => const DetalleUsuarioScreen());

      case AppRoutes.usuarios:
        return MaterialPageRoute(builder: (_) => const UsuarioScreen());

      case AppRoutes.ventas:
        return MaterialPageRoute(builder: (_) => const VentaScreen());

      case AppRoutes.pedidos:
        return MaterialPageRoute(builder: (_) => const PedidoScreen());

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
