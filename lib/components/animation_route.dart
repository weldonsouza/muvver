import 'package:flutter/material.dart';
import 'package:muvver/repositories/traveler_repository.dart';
import 'package:muvver/screens/home/trip/trip_created.dart';
import 'package:muvver/utils/globals.dart';

class AnimationRoute extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {

    print("Iniciando pagamento....");

    Future.delayed(const Duration(seconds: 3), () async {
      var transportDados, similarSizeDados, weightdados;

      var destinations = [
        {
          '"lat"': '"-20.4810858"',
          '"lng"': '"-54.7055742"'
        },
        {
          '"lat"': '"-22.2312915"',
          '"lng"': '"-54.8297065"'
        }
      ];

      transportDados = transportSelect(transport);
      similarSizeDados = similarSizeSelect(similarSize);
      weightdados = weightSelect(weight);

      final response = await TravelerRepository().createTravel(transportDados, departureDate, arrivalDate, similarSizeDados, weightdados, price, destinations);

      if(response != null){
        Navigator.push(context, MaterialPageRoute(builder: (context) => TripCreated()));
      }
    });

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
          Text(
            'Criando Viagem...',
            style: TextStyle(color: Colors.white, fontSize: mediaQuery(context, 0.05)),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}