import 'package:delivery_app/entities/bd/Restaurante.dart';
import 'package:delivery_app/entities/bd/RestaurantesAlimentos.dart';
import 'package:delivery_app/screens/EditProfile.dart';
import 'package:delivery_app/screens/Settings.dart';
import 'package:delivery_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/src/route.dart';

class Home extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const Home({
    super.key,
    required this.navigationShell,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 270,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(30),
                      child: TextFormField(
                        onTap: () {
                          context.push('/busqueda');
                        },
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFf1f1f1),
                          labelText: 'Search products',
                          hintText: 'Search products',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.search),
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  }),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.red,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: widget.navigationShell.currentIndex,
          onTap: (index) {
            setState(() {
              widget.navigationShell.goBranch(index, initialLocation: true);
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Items car',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
        body: widget.navigationShell);
  }
}

class SearchTest extends StatelessWidget {
  const SearchTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Busqueda'),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cart'),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorite'),
    );
  }
}

class HomeFinal extends StatefulWidget {
  final String? nombre;
  const HomeFinal({
    super.key,
    this.nombre,
  });

  @override
  State<HomeFinal> createState() => _HomeFinalState();
}

class _HomeFinalState extends State<HomeFinal>
    with SingleTickerProviderStateMixin {
  late final tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 8, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: PreferredSize(
              preferredSize: Size.fromHeight(150),
              child: TabBar(
                indicatorColor: Colors.transparent,
                isScrollable:
                    true, //este de aca nos permite scrollear en el tabbbbarr
                dividerColor: Colors.transparent,
                controller: tabController,
                tabs: const [
                  TabWidget(
                    title: "Saludable",
                    assetUrl: 'assets/saludable2.png',
                  ),
                  TabWidget(title: 'Pizza', assetUrl: 'assets/pizza2.png'),
                  TabWidget(
                      title: 'Hamburguesa',
                      assetUrl: 'assets/hamburguesa3.jpg'),
                  TabWidget(title: 'Pollo', assetUrl: 'assets/pollo.jpg'),
                  TabWidget(title: 'Criollo', assetUrl: 'assets/ceviche.jpeg'),
                  TabWidget(title: 'Vegano', assetUrl: 'assets/vegano2.jpeg'),
                  TabWidget(
                    title: "Saludable",
                    assetUrl: 'assets/saludable2.png',
                  ),
                  TabWidget(
                      title: "Saludable", assetUrl: 'assets/saludable2.png'),
                ],
              ),
            ),
          ),
        ),
        Text(
          'Hola de vuelta, ${widget.nombre}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Expanded(
          child: TabBarView(controller: tabController, children: [
            Center(child: TabPagePrincipal()),
            Center(
              child: Text('Page 2'),
            ),
            Center(
              child: Text('Page 3'),
            ),
            Center(
              child: Text('Page 4'),
            ),
            Center(
              child: Text('Page 5'),
            ),
            Center(
              child: Text('Page 6'),
            ),
            Center(
              child: Text('Page 7'),
            ),
            Center(
              child: Text('Page 8'),
            ),
          ]),
        ),
      ],
    );
  }
}

class TabWidget extends StatelessWidget {
  final String title;
  final String assetUrl;

  const TabWidget({
    super.key,
    required this.title,
    required this.assetUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Tab(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(255, 206, 202, 202)),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 208, 207, 207).withOpacity(0.6),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          height: 110,
          width: 95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('${assetUrl}'), Text('${title}')],
          ),
        ),
      ),
    );
  }
}

class TabPagePrincipal extends StatefulWidget {
  final String? idRestaurante;
  const TabPagePrincipal({
    super.key,
    this.idRestaurante,
  });

  @override
  State<TabPagePrincipal> createState() => _TabPagePrincipalState();
}

class _TabPagePrincipalState extends State<TabPagePrincipal> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 100,
          child: CategoryRow(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Special Offers'),
                  TextButton(onPressed: () {}, child: Text('View all'))
                ],
              ),
              SizedBox(
                height: 100,
                child: RowSpecial(),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 500,
                child: Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: restaurantes.length,
                        itemBuilder: (context, index) {
                          //int indiceAlimento = restaurantes[index].listaAlimentos.length; -> ver la manera de manejar el indice de las listas de alimentos de cada restaurante
                          return InkWell(
                            onTap: () {
                              context.push(
                                  '/food/${restaurantes[index].id.toString()}');
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              width: 300,
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          '${restaurantes[index].listaAlimentos[0].nombre}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          '${restaurantes[index].listaAlimentos[0].precio}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        Text('${restaurantes[index].nombre}'),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 100,
                                    //   width: 30,
                                    //   child: Image.network('${restaurantes[index].listaAlimentos[0].imagenUrl}')),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class FoodDetails extends StatefulWidget {
  final String? idRestauranteRecibido;
  const FoodDetails({super.key, this.idRestauranteRecibido});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  late Restaurante restauranteRecibido;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (Restaurante rest in restaurantes) {
      if (widget.idRestauranteRecibido == rest.id) {
        restauranteRecibido = rest;
        break;
      } else {
        restauranteRecibido = restaurantes[0];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250,
            width: 350, 
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey), 
            ),
            child: ClipRRect(
              
              borderRadius: BorderRadius.circular(7),
              child: Image.network(
                '${restauranteRecibido.listaAlimentos[0].imagenUrl}',
                fit: BoxFit
                    .cover, 
              ),
            ),
          ),
          ListTile(
            title: Text(
              '${restauranteRecibido.listaAlimentos[0].nombre}',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text('${restauranteRecibido.listaAlimentos[0].precio}',
                style: TextStyle(fontSize: 20)),
          ),
          Text('${restauranteRecibido.listaAlimentos[0].descripcion}',
              style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

class RowSpecial extends StatelessWidget {
  const RowSpecial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Row(
          children: [
            SizedBox(width: 5),
            Container(
              padding: EdgeInsets.all(15),
              width: 150,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
            ),
            SizedBox(width: 5),
            Container(
              padding: EdgeInsets.all(15),
              width: 150,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
            ),
            SizedBox(width: 5),
            Container(
              padding: EdgeInsets.all(15),
              width: 150,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
            ),
            SizedBox(width: 5),
            Container(
              padding: EdgeInsets.all(15),
              width: 150,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
            ),
            SizedBox(width: 5),
            Container(
              padding: EdgeInsets.all(15),
              width: 150,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
      ],
    );
  }
}

class CategoryRow extends StatelessWidget {
  const CategoryRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Row(
          children: [
            SizedBox(width: 5),
            Container(
              padding: EdgeInsets.all(15),
              width: 150,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
            ),
            SizedBox(width: 5),
            Container(
              padding: EdgeInsets.all(15),
              width: 150,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
            ),
            SizedBox(width: 5),
            Container(
              padding: EdgeInsets.all(15),
              width: 150,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
            ),
            SizedBox(width: 5),
            Container(
              padding: EdgeInsets.all(15),
              width: 150,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
            ),
            SizedBox(width: 5),
            Container(
              padding: EdgeInsets.all(15),
              width: 150,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
      ],
    );
  }
}
