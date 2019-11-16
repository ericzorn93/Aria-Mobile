import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserRepository extends Equatable {
  @override
  List<Object> get props => [];

  Future<String> login() async {
    await Future.delayed(Duration(seconds: 2));
    return 'iosadhfhasdfoihas';
  }
}
