import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  final String emailAddress;

  EmailChanged({@required this.emailAddress});

  @override
  List<Object> get props => [emailAddress];

  @override
  String toString() => 'EmailChanged { email: $emailAddress }';
}
