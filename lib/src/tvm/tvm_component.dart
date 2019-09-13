import 'dart:math';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/utils/color/material.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:tvmDart/pv_model.dart';

@Component(
    selector: 'tvm',
    styleUrls: ['tvm_component.css'],
    templateUrl: 'tvm_component.html',
    directives: [
      coreDirectives,
      MaterialCheckboxComponent,
      MaterialFabComponent,
      MaterialIconComponent,
      materialInputDirectives,
      MaterialRadioGroupComponent,
      MaterialRadioComponent,
      MaterialButtonComponent,
      MaterialInputComponent,
      MaterialNumberValueAccessor,
      MaterialNumberValidator,
      materialNumberInputDirectives,
      ScoreboardComponent,
      ScorecardComponent,
      formDirectives,
      NgFor,
      NgIf,
    ],
    providers: [materialProviders],
    pipes: commonPipes,
    exports: [green500, greenA400])
class TVMComponent {
  List<String> items = [];
  String newTodo = '';

  final modeOptions = [
    'Present Value',
    'Future Value',
    'Interest Rate',
    'Number of Periods'
  ];

  String option;
  PV pVModel = PV(0, 0, 0, 0);
  bool submitted = false;
  double percentR;

  double getPercent(double r) {
    return r / 100;
  }

  void getPV() {
    var r = getPercent(pVModel.r);
    pVModel.pV = pVModel.fV / pow((1 + r), pVModel.t);
    submitted = true;
  }

  void getFV() {
    var r = getPercent(pVModel.r);
    pVModel.fV = pVModel.pV * pow((1 + r), pVModel.t);
    submitted = true;
  }

  void getT() {
    var r = getPercent(pVModel.r);
    pVModel.t = log( (pVModel.fV/pVModel.pV) ) / log(1 + r);
    submitted = true;
  }


}
