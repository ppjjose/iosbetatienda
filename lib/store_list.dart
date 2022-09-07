import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiendabeta/main.dart';
import 'package:tiendabeta/provider.dart';
import 'package:tiendabeta/staggereddualview.dart';
import 'package:tiendabeta/store_details.dart';

class StoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoreProviders.of(context)!.bloc;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: backgroudColor,
            padding: const EdgeInsets.only(top: cartBarHeight + 10,left: 10,right: 10, bottom: 10),
            child: StaggeredDualView(
                aspectRatio: 0.7,
                offsetPercent: 0.3,
                spacing: 10,
                itemBuilder: (context, index){
                  final product = bloc.catalog[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 900),
                          pageBuilder: (context, animation, __){
                            return FadeTransition(
                              opacity: animation,
                              child: StoreDetails(
                                  product: product,
                                  onProductAdded: (){
                                    bloc.addProduct(product);
                                  }
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child:
                    Card(
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 4,
                        shadowColor: Colors.black45,
                        color: Color(0xFFEAE2D2),
                        child:
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child:  Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Hero(
                                  tag: 'list_${product.name}',
                                  child: Image.asset(
                                    product.image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                '\$${product.price}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                product.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 14
                                ),
                              ),
                              Text(
                                product.weight,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontSize: 14
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  );
                },
                itemCount: bloc.catalog.length
            ),
          )
        ],
      ),
    );
  }
}