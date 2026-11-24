
import 'package:flutter/material.dart'; // Importa los componentes visuales de Flutter.
import 'package:flutter_test/flutter_test.dart'; // Importa las herramientas de pruebas.
import 'package:kevinrosarioleccion6sc/main.dart'; // Importa la aplicación principal.

// Inicia las pruebas de la aplicación.
void main() {
  // Comprueba que funcione el formulario de registro.
  testWidgets('Verifica el formulario de registro', (WidgetTester tester) async {
    // Construye la aplicación para realizar la prueba.
    await tester.pumpWidget(const EmpresaXYZApp());

    // Comprueba que aparezca el título de la aplicación.
    expect(find.text('Empresa XYZ · Registro'), findsOneWidget);

    // Comprueba que existan cuatro campos de texto.
    expect(find.byType(TextField), findsNWidgets(4));

    // Comprueba que aparezca el botón Mostrar datos.
    expect(find.text('MOSTRAR DATOS'), findsOneWidget);
  }); // Finaliza la prueba.
} // Finaliza main.
