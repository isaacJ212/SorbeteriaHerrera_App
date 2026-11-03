import 'package:flutter/material.dart';
import 'package:herrera_app/core/dependency_injection/DI.dart';
import 'package:herrera_app/presentation/providers/reporte_inventario_provider.dart';
import 'package:herrera_app/presentation/providers/userDetails_provider.dart';
import 'package:provider/provider.dart';

import '../screens/dashboard/dashboard_screen.dart';
import '../screens/detalle_producto/detalle_producto_screen.dart';
import '../screens/detalle_usuario/detalle_usuario_screen.dart';
import '../screens/detalle_venta/detalle_venta_screen.dart';
import '../screens/historial_acceso/historial_acceso_screen.dart';
import '../screens/inventario/inventario_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/mas/mas_screen.dart';
import '../screens/mi_cuenta/mi_cuenta_screen.dart';
import '../screens/not_found/not_found_screen.dart';
import '../screens/pedido/pedido_screen.dart';
import '../screens/detalle_pedido/detalle_pedido_screen.dart';
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
        final productId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => DetalleDeProductoScreen(productId: productId),
        );

      case AppRoutes.detalleVenta:
        return MaterialPageRoute(builder: (_) => const DetalleDeVentaScreen());

      // DESPUÉS
      case AppRoutes.reporteInventario:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => getIt<ReporteInventarioProvider>()..cargarReporte(),
            child: const ReporteDeInventarioScreen(),
          ),
        );

      case AppRoutes.historialAcceso:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => getIt<HistorialAccesoProvider>()..cargarHistorial(),
            child: const HistorialAccesoScreen(),
          ),
        );

      case AppRoutes.mas:
        return MaterialPageRoute(builder: (_) => const MasScreen());

      case AppRoutes.miCuenta:
        return MaterialPageRoute(builder: (_) => const MiCuentaScreen());

      case AppRoutes.detalleUsuario:
        final userId = settings.arguments as int? ?? 1;
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => getIt<UserdetailsProvider>()..loadUser(userId),
            child: const DetalleUsuarioScreen(),
          ),
        );

      case AppRoutes.usuarios:
        return MaterialPageRoute(builder: (_) => const UsuarioScreen());

      case AppRoutes.ventas:
        return MaterialPageRoute(builder: (_) => const VentaScreen());

      case AppRoutes.pedidos:
        return MaterialPageRoute(builder: (_) => const PedidoScreen());

      case AppRoutes.detallePedido:
        return MaterialPageRoute(builder: (_) => const DetallePedidoScreen());

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
