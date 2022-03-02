

import 'package:challenges2022/first%20month/shared/Styles/styles.dart';
import 'package:flutter/material.dart';

BoxDecoration selectedArDecoration = selectedLang ;
BoxDecoration selectedFrDecoration = unselectedLang ;
BoxDecoration selectedEnDecoration = unselectedLang ;

double opacity = 0;
bool selectedAr = true;
bool selectedFr = false;
bool selectedEn = false;


void checkChoosingLang()
{
  if(selectedAr)
  {
    selectedArDecoration = selectedLang;
    selectedFrDecoration = unselectedLang;
    selectedEnDecoration = unselectedLang;
  }
  else
  {
    selectedArDecoration = unselectedLang;
  }
  if(selectedFr)
  {
    selectedFrDecoration = selectedLang;
    selectedArDecoration = unselectedLang;
    selectedEnDecoration = unselectedLang ;
  }
  else
  {
    selectedFrDecoration= unselectedLang;
  }
  if(selectedEn)
  {
    selectedFrDecoration = unselectedLang;
    selectedArDecoration = unselectedLang;
    selectedEnDecoration = selectedLang ;
  }
  else
  {
    selectedEnDecoration= unselectedLang;
  }

}


String? localeApp;

