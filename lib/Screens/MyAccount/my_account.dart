import 'package:flutter/material.dart';
import '../../Widgets/bottom_navbar.dart';


class MyAccountScreen extends StatelessWidget{
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      appBar: _buildAppBar(),
      body : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGeneralConfigSection(),
            _buildSystemManagementSection(),
            _buildPreferencesSection(),
            _buildLogoutButton(),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavbar(
        currentIndex:4,
        onTap:(index){
        }
      ),
    );
  }


  // appBar

  PreferredSizeWidget _buildAppBar(){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Color(0xFF10251F)),
        onPressed: (){},
      ),
      title: const Text(
        'Mi cuenta',
        style: TextStyle(
          color: Color(0xFF10251F),
          fontSize: 20,
          fontWeight: FontWeight.w500,
          ),
        ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Color(0xFF10251F)),
          onPressed: (){},
        ),
        IconButton(
          icon : const Icon(Icons.filter_list, color: Color(0xFF10251F)),
          onPressed: () {},
        ),
      ],
    );
  }
  

  // configuracion general 

  Widget _buildGeneralConfigSection(){
    return Column(
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 24, 20, 8),
          child: Text(
            'Configuracion General',
            style: TextStyle(
              color: Color(0xFF09A982),
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Mi cuenta',
                style: TextStyle(
                  color: Color(0xFF10251F),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF95F1D0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: Color(0xFF007057),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Turno Activo',
                      style: TextStyle(
                        color: Color(0xFF007057),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

            ],

          ),
        ),

        const SizedBox(height: 20),
        _buildProfileCard(),
      ],
    );
  }


  Widget _buildProfileCard(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow:[
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ]
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: NetworkImage('https://i.pinimg.com/564x/9d/6b/9d/9d6b9db2dcb0526a09b89fb35d075c72.jpg'),
                        fit : BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF006C53),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.settings,
                        size: 16,
                        color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width:16),

              //ifnormacion del usuario

              Expanded(
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Isaac Jimenez',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF10251F),
                          ),
                        ),

                        const SizedBox(width: 8),
                        
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2, 
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF95F1D0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Admin',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF007057),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4,),
                    const Text(
                      'Administrador General',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF09A982),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2,),
                    const Text(
                      'admin@sorbeteriaHerra.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 100, 54, 13),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20,),

          //  boton de editar perfil
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: (){

              },
              icon:  const Icon(Icons.edit_note),
              label: const Text(
                'Edfitar perfil',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                )
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006C53),
                foregroundColor: Colors.white,
                //borderRadius: BorderRadius.circular(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }


  //secci0n de la gestion del sistema

  Widget _buildSystemManagementSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Gestion del sistema',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF64736D),
                  letterSpacing: 0.5,
                ),

              ),
              const Text(
                '3 Modulos',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF09A982),
                ),
              ),
            ],
          ),
        ),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
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
            children: [
              _buildMenuItem(
                icon: Icons.people_outline,
                title: 'Usuarios y Roles',
                subtitle: 'Cajeros, maestros sorbeteros y personal',
                badge: '8 pers.',
                badgeColor: const Color(0xFFE7EEFF),
                badgeTextColor: const Color(0xFF4A6FA9),
              ),
              _buildDivider(),
              _buildMenuItem(
                icon: Icons.shield_outlined,
                title: 'Historial de Acceso y Auditoría',
                subtitle: 'Registros de cajas, mermas y modificaciones',
                showArrow: true,
              ),
              _buildDivider(),
              _buildMenuItem(
                icon: Icons.local_shipping_outlined,
                title: 'Gestión de Pedidos y Envíos',
                subtitle: 'Despachos de tinas mayoreo y caja',
                badge: '3 activos',
                badgeColor: const Color(0xFF95F1D0),
                badgeTextColor: const Color(0xFF007057),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //prefenciaas y soporte
  Widget _buildPreferencesSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsGeometry.fromLTRB(20, 32, 20, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Prefencias y soporte',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF64736D),
                  letterSpacing: 0.5
                ),
              ),
              const Text(
                'Equipos y ayuda',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8A9691),
                ),
              ),
            ],
          ),
        ),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 0.4),
              ),
            ],
          ),

          child: Column(
            children: [
              _buildMenuItem(
                icon: Icons.notifications_outlined,
                title: 'Notificaciones y Alertas de Stock',
                subtitle: 'Avisos de frutas de temporada y más',
                showArrow: true,
              ),
              _buildDivider(),
              _buildMenuItem(
                icon: Icons.support_agent_outlined,
                title: 'Centro de Ayuda - Soporte',
                subtitle: 'Manual operativo y contacto directo 24/7',
                showArrow: true,
              ),
              _buildDivider(),
              _buildMenuItem(
                icon: Icons.info_outline,
                title: 'Acerca de Sorbetería Herrera',
                subtitle: 'Tradición artesanal desde 1938',
                badge: 'v2.4.0',
                badgeColor: const Color(0xFFE7EEFF),
                badgeTextColor: const Color(0xFF4A6FA9),
              ),
            ],
          ),
        ),
      ],
    );
  }

//estos madre es una mause herramienta

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    String? badge,
    Color? badgeColor,
    Color? badgeTextColor,
    bool showArrow = false,
  }){
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F3FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF09A982),
          size: 24,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF64736D),
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (badge != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: badgeColor ?? const Color(0xFFE7EEFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: badgeTextColor ?? const Color(0xFF007057),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
          if (showArrow)
            const Icon(
              Icons.chevron_right,
              color: Color(0xFF8A9691),
            ),
        ],
      ),
      onTap: () {

      },
    );
  }

  Widget _buildDivider(){
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey,
    );
  }


// bopton de cerra sesion
  Widget _buildLogoutButton(){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
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
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFFFDAD6),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.logout,
              color: Color(0xFFBA1A1A),
              size: 24,
            ),
          ),
          title: const Text(
            'Cerrar Sesión',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFFBA1A1A),
            ),
          ),
          onTap: () {

          },
        ),
      ),
    );
  }

}