library my_prj.globals;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//******************  CONSTANTES GLOBAIS  **********************
const String base_url = 'https://staging.muvver.jera.com.br';
const String url_api = '$base_url/api/v1';
const String url_create_travel = 'https://staging.muvver.jera.com.br/v1/users/me/travels';
const String url_email = 'dev.teste@jera.com.br';
const String url_token = 'mBB_7c7_syJcCeD2YaKE4u3xBT1ns2yt';
const Color colorBase = Color(0xFF24B96E);

//******************  VARIÁVEIS GLOBAIS  ********************
final streamController = StreamController.broadcast();
final streamControllerButtonProduct = StreamController.broadcast();
final streamControllerButtonTotal = StreamController.broadcast();
var transport = '';
var departureDate = '';
var arrivalDate = '';
var similarSize = '';
var weight;
var price;
var destinations = [];

//******************  FUNÇÕES GLOBAIS  ********************
var formatFraction = NumberFormat("#,##0.00", "pt_BR");
var formatInt = NumberFormat("##", "pt_BR");

mediaQuery(BuildContext context, double value, {String direction}) {
  MediaQueryData mediaQuery = MediaQuery.of(context);
  direction = direction ?? 'H';
  Size size = mediaQuery.size;
  if (direction.toUpperCase() == 'H') {
    return size.width * value;
  } else {
    return size.height * value;
  }
}

transportSelect(transport){
  var transportation;

  if(transport == 'Carro'){
    transportation = 'car';
  } else if(transport == 'Avião'){
    transportation = 'plane';
  } else if(transport == 'Caminhão'){
    transportation = 'truck';
  } else if(transport == 'Van'){
    transportation = 'van';
  } else if(transport == 'Moto'){
    transportation = 'motorcycle';
  } else if(transport == 'Bicicleta'){
    transportation = 'bike';
  } else if(transport == 'Trem'){
    transportation = 'train';
  } else if(transport == 'Ônibus'){
    transportation = 'bus';
  } else if(transport == 'Embarcação'){
    transportation = 'boat';
  }

  return transportation;
}

similarSizeSelect(size){
  var similarSize;

  if(size == 'Envelope'){
    similarSize = 'envelope';
  } else if(size == 'Livro'){
    similarSize = 'book';
  } else if(size == 'Caixa de sapato'){
    similarSize = 'shoe_box';
  } else if(size == 'Mochila'){
    similarSize = 'backpack';
  } else if(size == 'Mala grande'){
    similarSize = 'medium_case';
  } else if(size == 'Caixa grande'){
    similarSize = 'big_case';
  }

  return similarSize;
}

weightSelect(weight){
  var weightProduct;

  if(weight == 'Até 1 kg'){
    weightProduct = 1;
  } else if(weight == 'Até 5 kg'){
    weightProduct = 5;
  } else if(weight == 'Até 10 kg'){
    weightProduct = 10;
  } else if(weight == 'Até 20 kg'){
    weightProduct = 20;
  } else if(weight == 'Outro'){
    weightProduct = 30;
  }

  return weightProduct;
}
