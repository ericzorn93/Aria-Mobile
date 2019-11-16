import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserRepository extends Equatable {
  final String emailAddress;
  final String firstName;
  final String lastName;
  final int age;
  final String authToken;

  @override
  List<Object> get props => [emailAddress, firstName, lastName, age, authToken];

  UserRepository(
      {@required this.emailAddress,
      @required this.firstName,
      @required this.lastName,
      @required this.age,
      this.authToken});

  String get fullName {
    return "$firstName $lastName";
  }
}
