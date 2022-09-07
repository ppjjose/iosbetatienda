import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiendabeta/provider.dart';
import 'package:tiendabeta/store_bloc.dart';
import 'package:tiendabeta/store_cart.dart';
import 'package:tiendabeta/store_list.dart';

const backgroudColor = Color(0XFFF6F5F2);
const cartBarHeight = 100.0;
const _panelTransition = Duration(milliseconds: 600);

void main() {
  runApp(MaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: const Color(0XFF000000)),
    home: TiendabetaHOme(),
    debugShowCheckedModeBanner: false,
  )
  );
}

class TiendabetaHOme extends StatefulWidget {
  @override
  _TiendabetaState createState() => _TiendabetaState();
}

class _TiendabetaState extends State<TiendabetaHOme> {
  final bloc = Storebloc();
  void _onverticalGesture(DragUpdateDetails details) {
    print(details.primaryDelta);
    if((details.primaryDelta ?? 0) < -7) {
      bloc.changeToCart();
    } else if ((details.primaryDelta ?? 0) > 12) {
      bloc.changeToNormal();
    }
  }

  double _getTopForWhitePnale (StoreState state, Size size) {
    if (state == StoreState.normal) {
      return -cartBarHeight + kToolbarHeight;
    } else if (state == StoreState.cart) {
      return -(size.height - kToolbarHeight - cartBarHeight /2 );
    }
    throw '';
  }

  double _getTopForBlackPnale (StoreState state, Size size) {
    if (state == StoreState.normal) {
      return size.height - cartBarHeight;
    } else if (state == StoreState.cart) {
      return cartBarHeight /2;
    }
    throw '';
  }

  double _getTopForAppBar (StoreState state) {
    if (state == StoreState.normal) {
      return 0.0;
    } else if (state == StoreState.cart) {
      return - cartBarHeight;
    }
    throw '';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Scaffold(
      body: Stack(
        children: [
          StoreProviders(
              bloc: bloc,
              child: AnimatedBuilder(
                  animation: bloc,
                  builder: (context, _) {
                    return
                      Scaffold(
                        body: Stack(
                          children: [
                            AnimatedPositioned(
                                duration: _panelTransition,
                                curve: Curves.decelerate,
                                left: 0,
                                right: 0,
                                top: _getTopForWhitePnale(bloc.storeState, size),
                                height: size.height - kToolbarHeight,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30)
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: StoreList(),
                                    ))
                            ),
                            AnimatedPositioned(
                                duration: _panelTransition,
                                curve: Curves.decelerate,
                                left: 0,
                                right: 0,
                                top: _getTopForBlackPnale(bloc.storeState, size),
                                height: size.height - kToolbarHeight,
                                child: GestureDetector(
                                  onVerticalDragUpdate: _onverticalGesture,
                                  child: Container(
                                    color: Colors.black,
                                    child: Column(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.all(25),
                                            child: AnimatedSwitcher(
                                              duration: _panelTransition,
                                              child: SizedBox(
                                                height: kToolbarHeight,
                                                child: bloc.storeState == StoreState.normal ?
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Carrito',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child:
                                                        SingleChildScrollView(
                                                            scrollDirection: Axis.horizontal,
                                                            child: Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                              child: Row(
                                                                  children: List.generate(
                                                                      bloc.cart.length,
                                                                          (index) => Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal: 9.0),
                                                                        child: Stack(
                                                                          children: [
                                                                            Hero(
                                                                                tag: 'list_${bloc.cart[index].product.name}details',
                                                                                child: CircleAvatar(
                                                                                  backgroundColor: Colors.white,
                                                                                  backgroundImage: AssetImage(
                                                                                    bloc.cart[index].product.image,
                                                                                  ),
                                                                                )
                                                                            ),
                                                                            Positioned(
                                                                                right: 0,
                                                                                child: CircleAvatar(
                                                                                  radius: 10,
                                                                                  backgroundColor: Colors.red,
                                                                                  child: Text(
                                                                                    bloc.cart[index].quantity.toString(),
                                                                                    style: TextStyle(
                                                                                        color: Colors.white
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                            )
                                                                          ],
                                                                        ),
                                                                      )

                                                                  )

                                                              ),
                                                            )

                                                        )
                                                    ),
                                                    CircleAvatar(
                                                      backgroundColor: Color(0xFFF4C459),
                                                      child: Text(
                                                        bloc.totalCartElements().toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ) : const SizedBox.shrink(),),
                                            )
                                        ),
                                        Expanded(child: StoreCart()),
                                      ],
                                    ),
                                  ),
                                )
                            ),
                            AnimatedPositioned(
                                curve: Curves.decelerate,
                                duration: _panelTransition,
                                left: 0,
                                right: 0,
                                top: _getTopForAppBar(bloc.storeState),
                                child: _AppBar(
                                )
                            )
                          ],
                        ),
                      );
                  }
              )
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: Color(0xFF81502A),
      child: Row(
        children: [
          /*BackButton(
            color: Colors.black,
          ),*/
          const SizedBox(width: 0,),
          Expanded(
              child: Text(
                'LA JAUS',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Pacifico'
                ),

                textAlign: TextAlign.center,
              )
          ),
          /*IconButton(
            icon: Icon(Icons.access_time),
            onPressed: () => null,
          )*/
        ],
      ),
    );
  }
}



