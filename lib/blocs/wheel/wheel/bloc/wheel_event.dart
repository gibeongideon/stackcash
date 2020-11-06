part of 'wheel_bloc.dart';

abstract class WheelEvent extends Equatable {
  const WheelEvent();
}

class WheelButtonPressed extends WheelEvent {
  // final double vel;

  // const WheelButtonPressed({
  //   @required this.vel,
  // });

  @override
  List<Object> get props => [];

  // @override
  // String toString() => 'WheelButtonPressed { vel: $vel }';
}
