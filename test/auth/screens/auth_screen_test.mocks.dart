// Mocks generated by Mockito 5.4.5 from annotations
// in flutter_listin/test/auth/screens/auth_screen_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:firebase_auth/firebase_auth.dart' as _i2;
import 'package:flutter_listin/authentication/services/auth_service.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFirebaseAuth_0 extends _i1.SmartFake implements _i2.FirebaseAuth {
  _FakeFirebaseAuth_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i3.AuthService {
  MockAuthService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseAuth get firebaseAuth =>
      (super.noSuchMethod(
            Invocation.getter(#firebaseAuth),
            returnValue: _FakeFirebaseAuth_0(
              this,
              Invocation.getter(#firebaseAuth),
            ),
          )
          as _i2.FirebaseAuth);

  @override
  set firebaseAuth(_i2.FirebaseAuth? _firebaseAuth) => super.noSuchMethod(
    Invocation.setter(#firebaseAuth, _firebaseAuth),
    returnValueForMissingStub: null,
  );

  @override
  _i4.Future<String?> login({required String? email, required String? senha}) =>
      (super.noSuchMethod(
            Invocation.method(#login, [], {#email: email, #senha: senha}),
            returnValue: _i4.Future<String?>.value(),
          )
          as _i4.Future<String?>);

  @override
  _i4.Future<String?> signup({
    required String? email,
    required String? senha,
    required String? nome,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#signup, [], {
              #email: email,
              #senha: senha,
              #nome: nome,
            }),
            returnValue: _i4.Future<String?>.value(),
          )
          as _i4.Future<String?>);

  @override
  _i4.Future<String?> createNewPassword({required String? email}) =>
      (super.noSuchMethod(
            Invocation.method(#createNewPassword, [], {#email: email}),
            returnValue: _i4.Future<String?>.value(),
          )
          as _i4.Future<String?>);

  @override
  _i4.Future<String?> logout() =>
      (super.noSuchMethod(
            Invocation.method(#logout, []),
            returnValue: _i4.Future<String?>.value(),
          )
          as _i4.Future<String?>);

  @override
  _i4.Future<String?> removeAccount({required String? senha}) =>
      (super.noSuchMethod(
            Invocation.method(#removeAccount, [], {#senha: senha}),
            returnValue: _i4.Future<String?>.value(),
          )
          as _i4.Future<String?>);
}
