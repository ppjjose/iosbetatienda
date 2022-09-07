import 'package:flutter/material.dart';
import 'package:tiendabeta/store_bloc.dart';

class StoreProviders extends InheritedWidget {
  final Storebloc bloc;
  final Widget child;
  StoreProviders({
    required this.bloc,
    required this.child
  }) : super(child: child);

  static StoreProviders? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<StoreProviders>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;


}