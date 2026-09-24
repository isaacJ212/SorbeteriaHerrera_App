import 'package:herrera_app/Screens/AccessHistory/AccesHistory.dart';
import 'package:herrera_app/Screens/Pedido/pedido_screen.dart';
import 'package:herrera_app/Screens/UserDetails/user_detail_screen.dart';

import 'app_routes.dart';
import 'package:flutter/material.dart';
import '../Screens/Login/login_screen.dart';
import '../Screens/Dashboard/dashboard_screen.dart';
import '../Screens/Inventario/inventario_screen.dart';
import '../Screens/Detalle_de_Producto/detalle_de_producto_screen.dart';
import '../Screens/Detalle_de_Venta/detalle_de_venta_screen.dart';
import '../Screens/Reporte_de_Inventario/reporte_de_inventario_screen.dart';
import '../Screens/NotFound/not_found_screen.dart';

import '../Screens/Usuario/usuario_screen.dart';
import '../Screens/Ventas/venta_screen.dart';
import '../Screens/MyAccount/my_account.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case AppRoutes.inventario:
        return MaterialPageRoute(builder: (_) => const InventarioScreen());
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
      case AppRoutes.Accesshistory:
        return MaterialPageRoute(builder: (_) => const Accesshistory());
      case AppRoutes.miAccount:
        return MaterialPageRoute(builder: (_) => const MyAccountScreen());
      case AppRoutes.userDetails:
        return MaterialPageRoute(builder: (_) => const UserDetailScreen());
      case AppRoutes.usuarios:
        return MaterialPageRoute(builder: (_) => const UsuarioScreen());
      case AppRoutes.ventas:
        return MaterialPageRoute(builder: (_) => const VentaScreen());
      case AppRoutes.pedidos:
        return MaterialPageRoute(builder: (_) => const PedidoScreen());
      case AppRoutes.notFound:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
