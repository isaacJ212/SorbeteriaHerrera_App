class ProductoInventarioModel {
  final String nombre;
  final String stock;
  final String precio;
  final bool stockBajo;

  const ProductoInventarioModel(
    this.nombre,
    this.stock,
    this.precio,
    this.stockBajo,
  );
}
