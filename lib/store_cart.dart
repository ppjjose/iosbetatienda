import 'package:flutter/material.dart';
import 'package:tiendabeta/main.dart';
import 'package:tiendabeta/provider.dart';
import 'package:tiendabeta/store_bloc.dart';

class StoreCart extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final bloc = StoreProviders.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Pedidos',style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: bloc!.bloc.cart.length,
                      itemBuilder: (context, index) {
                        final item = bloc.bloc.cart[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                  item.product.image,
                                ),
                              ),
                              const SizedBox(width: 15.0,),
                              Text(
                                item.quantity.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Text('x',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Text(
                                item.product.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Spacer(),
                              Text(
                                  '\$${(item.product.price * item.quantity).toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                                ),
                              ),
                              IconButton(
                                  onPressed: (){
                                    bloc.bloc.deleteProduct(item);
                                  },
                                  icon: Icon(Icons.delete),
                                color: Colors.white,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )

          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                    'Total',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                    )
                ),
                Spacer(),
                Text(
                  '\$${bloc?.bloc.totalPriceElements().toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              child: Text('Pedir',style: TextStyle(fontSize: 20, color: Colors.black),),
              style: ElevatedButton.styleFrom(primary: Color(0xFFF4C459), shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              )),
              onPressed: () => null,
            ),
          )
        ],
      ),
    );

  }
}

/*color: Color(0xFFF4C459),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(30)
),
child: Padding(
padding: const EdgeInsets.symmetric(vertical: 15.0),
child: Text(
'Pagar',
style: TextStyle(color: Colors.black,
fontSize: 20,
),
),
),*/