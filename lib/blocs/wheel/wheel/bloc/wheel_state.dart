part of 'wheel_bloc.dart';

abstract class WheelState extends Equatable {
  const WheelState();

  @override
  List<Object> get props => [];
}

class WheelInitial extends WheelState {}

class WheelLoading extends WheelState {}

class WheelSpinning extends WheelState {
    final double velocity;

  const WheelSpinning({@required this.velocity});

  @override
  List<Object> get props => [velocity];
}

class WheelFaliure extends WheelState {
  final String error;

  const WheelFaliure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => ' WheelFaliure { error: $error }';
}
