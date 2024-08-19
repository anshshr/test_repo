import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ColorPickerState extends Equatable {
  const ColorPickerState();

  @override
  List<Object> get props => [];
}

class ColorInitial extends ColorPickerState {
  
}

class ColorUpdated extends ColorPickerState {
  final Color updatedColor;

  const ColorUpdated(this.updatedColor);

  @override
  List<Object> get props => [updatedColor];
}
