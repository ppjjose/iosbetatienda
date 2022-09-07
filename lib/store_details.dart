import 'package:flutter/material.dart';
import 'package:tiendabeta/store_product.dart';

class StoreDetails extends StatefulWidget {
  const StoreDetails(
      {Key? key, required this.product, required this.onProductAdded})
      : super(key: key);
  final StoreProduct product;
  final VoidCallback onProductAdded;

  @override
  _StoreDetailsState createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  String heroTag = '';
  void  _addToCart(BuildContext context) {
    setState(() {
      heroTag = 'details';
    });
    widget.onProductAdded();
    Navigator.of(context).pop();
  }
  void _Titulo(){
    Text('hola');
  }

 @override
    Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       leading: BackButton(color: Colors.black,),
       backgroundColor: Colors.white,
       elevation: 0,
     ),
     backgroundColor: Colors.white,
     body: Column(
       children: [
         Expanded(
           child: Padding(
         padding: const EdgeInsets.all(15.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 Padding(
                     padding: const EdgeInsets.all(12.0),
                   child: Hero(
                     tag: 'list_${widget.product.name}$heroTag',
                     child: Image.asset(
                         widget.product.image,
                         fit: BoxFit.cover,
                         height: MediaQuery.of(context).size.height * 0.36
                     ),
                   ),
                 ),
                 Text(
                   widget.product.name,
                   style: Theme.of(context).textTheme.headline5?.copyWith(
                       color: Colors.black,
                       fontWeight: FontWeight.bold
                   ),
                 ),
                 const SizedBox(height: 15),
                 Text(
                  widget.product.weight,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Colors.grey
                  ),
                 ),
                 Row(
                   children: [
                     Spacer(),
                     Text(
                       '\$${widget.product.price}',
                       style: Theme.of(context).textTheme.headline4?.copyWith(
                         color: Colors.black,
                         fontWeight: FontWeight.bold
                       ),
                     )
                   ],
                 ),
                 const SizedBox(height: 15),
                 Text(
                   'About the product',
                   style: Theme.of(context).textTheme.subtitle1?.copyWith(
                     color: Colors.black,
                     fontWeight: FontWeight.bold
                   ),
                 ),
                 const SizedBox(height: 15),
                 Text(
                   widget.product.description,
                   style: Theme.of(context).textTheme.subtitle1?.copyWith(
                       color: Colors.grey,
                     fontWeight: FontWeight.w800
                   ),
                 ),
               ],
             ),
     )

         ),
         Padding(
             padding: const EdgeInsets.all(15.0),
           child: Row(
             children: [

               Expanded(
                   flex: 4,
                 child: ElevatedButton(
                   child:
                   Text('Añadir al pedido',style: TextStyle(fontSize: 18, color: Colors.black),),
                   style: ElevatedButton.styleFrom(
                       primary: Color(0xFFF4C459),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30),),
                     elevation: 5,
                     padding: const EdgeInsets.symmetric(vertical: 10)
                   ),
                   onPressed: () => null,
                 ),
               )
             ],
           ),
         )

       ],
     ),
   );
 }
 }