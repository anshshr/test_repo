import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ColorPickerEvent extends Equatable {
  const ColorPickerEvent();

  @override
  List<Object> get props => [];
}

class ColorSelected extends ColorPickerEvent {
  final Color selectedColor;

  const ColorSelected(this.selectedColor);

  @override
  List<Object> get props => [selectedColor];
}

