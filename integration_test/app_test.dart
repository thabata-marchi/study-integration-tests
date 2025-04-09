import "dart:math";

import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_listin/_core/constants/listin_keys.dart";
import "package:flutter_listin/firebase_options.dart";
import "package:flutter_listin/listins/widgets/home_drawer.dart";
import "package:flutter_listin/main.dart";
import "package:flutter_test/flutter_test.dart";
import "package:integration_test/integration_test.dart";

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Fluxo de autenticação", () {
    setUp(() async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await FirebaseAuth.instance.signOut();
    });
    testWidgets(
      "Telas de entrar e cadastrar",
      (tester) async {
        await tester.pumpWidget(MyApp());

        await tester.pumpAndSettle();

        expect(find.byType(TextFormField), findsNWidgets(2));

        expect(find.text("Entrar"), findsOneWidget);

        await tester.tap(
            find.text("Ainda não tem conta?\nClique aqui para cadastrar."));

        await tester.pumpAndSettle();

        expect(find.byType(TextFormField), findsNWidgets(4));

        expect(find.text("Cadastrar"), findsOneWidget);
      },
      // skip:true
    ); //Com o skip: true, esse teste não será executado quando rodarmos o arquivo.

    testWidgets("Fluxo Completo da aplicação", (tester) async {
      // 0. Comfigurações Iniciais
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();

      String name = "Thabata Marchi";
      String email = "thabata${Random().nextInt(899) + 100}@gmail.com";
      String password = "123321";

      // 1. Criar conta
      await tester.tap(
        find.byKey(const ValueKey(ListinKeys.authChangeStateButton)),
      );
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const ValueKey(ListinKeys.authNameTextField)),
        name,
      );

      await tester.enterText(
        find.byKey(const ValueKey(ListinKeys.authEmailTextField)),
        email,
      );

      await tester.enterText(
        find.byKey(const ValueKey(ListinKeys.authPasswordTextField)),
        password,
      );

      await tester.enterText(
        find.byKey(const ValueKey(ListinKeys.authConfirmPasswordTextField)),
        password,
      );
      await tester.pumpAndSettle(const Duration(seconds: 3));

      await tester.tap(find.byKey(const ValueKey(ListinKeys.authMainButton)));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      String listinName = "Feira de Maio";

      await tester.enterText(find.byType(TextFormField).first, listinName);
      await tester.tap(find.text("Salvar"));
      await tester.pumpAndSettle();

      expect(find.text(listinName), findsOneWidget);

      await tester.tap(find.text(listinName));
      await tester.pumpAndSettle();

      expect(find.text(listinName), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).first, "Abacate");
      await tester.enterText(find.byType(TextFormField).at(1), "2");
      await tester.enterText(find.byType(TextFormField).at(2), "5.50");

      await tester.tap(find.text("Adicionar produto"));
      await tester.pumpAndSettle();

      await tester.tap(find.text("Outros campos"));
      await tester.pumpAndSettle();

      // Quando o elemento não estiver visivel na tela, e for necesseário fazer scroll, o método scrollUntilVisible faz isso.
      await tester.scrollUntilVisible(
        find.text("Salvar"),
        500,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text("Salvar"));
      await tester.pumpAndSettle();

      expect(find.text("Abacate (x2)"), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // n. Sair, fazer login e excluir conta
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text(name), findsOneWidget);
      expect(find.text(email), findsOneWidget);

      await tester.tap(find.byKey(const ValueKey(ListinKeys.homeLogoutButton)));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const ValueKey(ListinKeys.authEmailTextField)),
        email,
      );
      await tester.enterText(
        find.byKey(const ValueKey(ListinKeys.authPasswordTextField)),
        password,
      );
      await tester.tap(find.byKey(const ValueKey(ListinKeys.authMainButton)));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await tester.tap(
          find.byWidget(HomeDrawer(user: FirebaseAuth.instance.currentUser!)));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(ValueKey(ListinKeys.homeRemoveUserButton)));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), password);
      await tester.tap(find.widgetWithText(TextButton, "EXCLUIR CONTA"));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await tester.enterText(
        find.byKey(const ValueKey(ListinKeys.authEmailTextField)),
        email,
      );

      await tester.enterText(
        find.byKey(const ValueKey(ListinKeys.authPasswordTextField)),
        password,
      );

      await tester.tap(find.byKey(const ValueKey(ListinKeys.authMainButton)));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text("invalid-credential"), findsOneWidget);
    });
  });
}
