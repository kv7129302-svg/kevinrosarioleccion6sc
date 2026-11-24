
import 'package:flutter/material.dart'; // Importa los componentes visuales de Flutter.

// Define el color verde principal de la aplicación.
const Color verdeEmpresa = Color(0xFF216B42);

// Define el color verde claro para la tarjeta.
const Color verdeClaro = Color(0xFFEAF4EC);

// Función principal que inicia la aplicación.
void main() {
  // Ejecuta el widget principal de la aplicación.
  runApp(const EmpresaXYZApp());
} // Finaliza la función main.

// Crea el widget principal de la aplicación.
class EmpresaXYZApp extends StatelessWidget {
  // Constructor del widget principal.
  const EmpresaXYZApp({super.key});

  // Construye la aplicación.
  @override
  Widget build(BuildContext context) {
    // Retorna la configuración general de Flutter.
    return MaterialApp(
      // Oculta la etiqueta de modo desarrollo.
      debugShowCheckedModeBanner: false,

      // Establece el nombre de la aplicación.
      title: 'Empresa XYZ - Registro',

      // Configura los colores generales.
      theme: ThemeData(
        // Define el color principal.
        colorScheme: ColorScheme.fromSeed(seedColor: verdeEmpresa),

        // Activa Material Design 3.
        useMaterial3: true,
      ),

      // Abre la pantalla del formulario.
      home: const RegistroScreen(),
    ); // Finaliza MaterialApp.
  } // Finaliza build.
} // Finaliza EmpresaXYZApp.

// Crea la pantalla del formulario mediante StatefulWidget.
class RegistroScreen extends StatefulWidget {
  // Constructor de la pantalla.
  const RegistroScreen({super.key});

  // Crea el estado que permitirá actualizar la pantalla.
  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
} // Finaliza RegistroScreen.

// Define el estado de la pantalla de registro.
class _RegistroScreenState extends State<RegistroScreen> {
  // Controlador para capturar el nombre completo.
  final TextEditingController ctrlNombre = TextEditingController();

  // Controlador para capturar la dirección.
  final TextEditingController ctrlDireccion = TextEditingController();

  // Controlador para capturar la fecha de nacimiento.
  final TextEditingController ctrlFecha = TextEditingController();

  // Controlador para capturar el cargo.
  final TextEditingController ctrlCargo = TextEditingController();

  // Variable que almacena los datos registrados.
  String? datos;

  // Función que permite seleccionar la fecha de nacimiento.
  Future<void> seleccionarFecha() async {
    // Abre el calendario para seleccionar una fecha.
    final DateTime? fecha = await showDatePicker(
      // Utiliza el contexto actual.
      context: context,

      // Establece una fecha inicial.
      initialDate: DateTime(2000, 1, 1),

      // Define la fecha más antigua permitida.
      firstDate: DateTime(1950),

      // Impide seleccionar fechas futuras.
      lastDate: DateTime.now(),
    ); // Finaliza showDatePicker.

    // Comprueba si el usuario seleccionó una fecha.
    if (fecha != null) {
      // Actualiza el campo con la fecha seleccionada.
      setState(() {
        // Convierte la fecha al formato día/mes/año.
        ctrlFecha.text =
        '${fecha.day.toString().padLeft(2, '0')}/'
            '${fecha.month.toString().padLeft(2, '0')}/'
            '${fecha.year}';
      }); // Finaliza setState.
    } // Finaliza la condición.
  } // Finaliza seleccionarFecha.

  // Función que muestra los datos ingresados.
  void mostrarDatos() {
    // Comprueba que ningún campo esté vacío.
    if (ctrlNombre.text.trim().isEmpty ||
        ctrlDireccion.text.trim().isEmpty ||
        ctrlFecha.text.trim().isEmpty ||
        ctrlCargo.text.trim().isEmpty) {
      // Muestra un aviso cuando falta información.
      ScaffoldMessenger.of(context).showSnackBar(
        // Construye el mensaje de advertencia.
        const SnackBar(
          // Define el texto del aviso.
          content: Text('Por favor, completa todos los campos.'),
        ), // Finaliza SnackBar.
      ); // Finaliza ScaffoldMessenger.

      // Detiene la función si faltan datos.
      return;
    } // Finaliza la validación.

    // Actualiza la pantalla con los datos registrados.
    setState(() {
      // Lee el contenido de cada controlador.
      datos = 'Nombre: ${ctrlNombre.text.trim()}\n'
          'Dirección: ${ctrlDireccion.text.trim()}\n'
          'Nacimiento: ${ctrlFecha.text.trim()}\n'
          'Cargo: ${ctrlCargo.text.trim()}';
    }); // Finaliza setState.
  } // Finaliza mostrarDatos.

  // Libera los controladores cuando se cierra la pantalla.
  @override
  void dispose() {
    // Libera el controlador del nombre.
    ctrlNombre.dispose();

    // Libera el controlador de la dirección.
    ctrlDireccion.dispose();

    // Libera el controlador de la fecha.
    ctrlFecha.dispose();

    // Libera el controlador del cargo.
    ctrlCargo.dispose();

    // Ejecuta la limpieza del estado.
    super.dispose();
  } // Finaliza dispose.

  // Construye la interfaz gráfica.
  @override
  Widget build(BuildContext context) {
    // Retorna la estructura visual de la pantalla.
    return Scaffold(
      // Establece el color de fondo.
      backgroundColor: Colors.white,

      // Construye la barra superior.
      appBar: AppBar(
        // Coloca el título solicitado.
        title: const Text('Empresa XYZ · Registro'),

        // Establece el fondo verde.
        backgroundColor: verdeEmpresa,

        // Coloca el texto de la barra en blanco.
        foregroundColor: Colors.white,
      ), // Finaliza AppBar.

      // Permite desplazarse si el contenido es largo.
      body: SingleChildScrollView(
        // Agrega espacio alrededor del formulario.
        padding: const EdgeInsets.all(20),

        // Organiza los elementos verticalmente.
        child: Column(
          // Alinea los elementos a la izquierda.
          crossAxisAlignment: CrossAxisAlignment.stretch,

          // Define los elementos del formulario.
          children: [
            // Etiqueta del campo nombre.
            const Text('Nombre completo'),

            // Agrega espacio antes del campo.
            const SizedBox(height: 7),

            // Campo para ingresar el nombre completo.
            TextField(
              // Conecta el campo con su controlador.
              controller: ctrlNombre,

              // Configura la apariencia del campo.
              decoration: const InputDecoration(
                // Muestra una sugerencia.
                hintText: 'Ej.: Ana María Pérez López',

                // Dibuja un borde alrededor del campo.
                border: OutlineInputBorder(),
              ), // Finaliza InputDecoration.
            ), // Finaliza TextField.

            // Agrega separación entre campos.
            const SizedBox(height: 15),

            // Etiqueta del campo dirección.
            const Text('Dirección'),

            // Agrega espacio antes del campo.
            const SizedBox(height: 7),

            // Campo para ingresar la dirección.
            TextField(
              // Conecta el campo con su controlador.
              controller: ctrlDireccion,

              // Configura la apariencia del campo.
              decoration: const InputDecoration(
                // Muestra una dirección de ejemplo.
                hintText: 'Ej.: Av. 25 de Julio y Pío Jaramillo',

                // Dibuja el borde del campo.
                border: OutlineInputBorder(),
              ), // Finaliza InputDecoration.
            ), // Finaliza TextField.

            // Agrega separación entre campos.
            const SizedBox(height: 15),

            // Etiqueta del campo fecha.
            const Text('Fecha de nacimiento'),

            // Agrega espacio antes del campo.
            const SizedBox(height: 7),

            // Campo para seleccionar la fecha.
            TextField(
              // Conecta el campo con su controlador.
              controller: ctrlFecha,

              // Impide escribir directamente en el campo.
              readOnly: true,

              // Abre el calendario cuando se toca el campo.
              onTap: seleccionarFecha,

              // Configura la apariencia del campo.
              decoration: const InputDecoration(
                // Muestra el formato esperado.
                hintText: 'dd/mm/aaaa',

                // Agrega el ícono de calendario.
                suffixIcon: Icon(Icons.calendar_month),

                // Dibuja el borde del campo.
                border: OutlineInputBorder(),
              ), // Finaliza InputDecoration.
            ), // Finaliza TextField.

            // Agrega separación entre campos.
            const SizedBox(height: 15),

            // Etiqueta del campo cargo.
            const Text('Cargo'),

            // Agrega espacio antes del campo.
            const SizedBox(height: 7),

            // Campo para ingresar el cargo.
            TextField(
              // Conecta el campo con su controlador.
              controller: ctrlCargo,

              // Configura la apariencia del campo.
              decoration: const InputDecoration(
                // Muestra un cargo de ejemplo.
                hintText: 'Ej.: Asistente administrativo',

                // Dibuja el borde del campo.
                border: OutlineInputBorder(),
              ), // Finaliza InputDecoration.
            ), // Finaliza TextField.

            // Agrega espacio antes del botón.
            const SizedBox(height: 22),

            // Crea el botón para mostrar los datos.
            ElevatedButton(
              // Ejecuta la función al presionar el botón.
              onPressed: mostrarDatos,

              // Configura la apariencia del botón.
              style: ElevatedButton.styleFrom(
                // Establece el fondo verde.
                backgroundColor: verdeEmpresa,

                // Establece el texto blanco.
                foregroundColor: Colors.white,

                // Define la altura del botón.
                minimumSize: const Size(double.infinity, 48),

                // Redondea ligeramente los bordes.
                shape: RoundedRectangleBorder(
                  // Define el radio de las esquinas.
                  borderRadius: BorderRadius.circular(8),
                ), // Finaliza RoundedRectangleBorder.
              ), // Finaliza ButtonStyle.

              // Define el texto del botón.
              child: const Text(
                // Escribe el nombre solicitado.
                'MOSTRAR DATOS',

                // Configura el estilo del texto.
                style: TextStyle(
                  // Coloca el texto en negrita.
                  fontWeight: FontWeight.bold,
                ), // Finaliza TextStyle.
              ), // Finaliza Text.
            ), // Finaliza ElevatedButton.

            // Agrega espacio antes del resultado.
            const SizedBox(height: 15),

            // Comprueba si todavía no existen datos.
            if (datos == null)
            // Muestra una tarjeta vacía como indicación.
              Container(
                // Agrega espacio interior.
                padding: const EdgeInsets.all(20),

                // Configura la decoración del contenedor.
                decoration: BoxDecoration(
                  // Establece un fondo gris claro.
                  color: const Color(0xFFF7F7F4),

                  // Dibuja un borde suave.
                  border: Border.all(color: Colors.black12),

                  // Redondea las esquinas.
                  borderRadius: BorderRadius.circular(10),
                ), // Finaliza BoxDecoration.

                // Muestra el texto de ayuda.
                child: const Text(
                  // Indica dónde aparecerán los datos.
                  'Aquí se mostrarán los datos\nal presionar el botón.',

                  // Centra el mensaje.
                  textAlign: TextAlign.center,

                  // Configura el color del mensaje.
                  style: TextStyle(color: Colors.black45),
                ), // Finaliza Text.
              ) // Finaliza Container.

            // Si existen datos, muestra la tarjeta de resultados.
            else
            // Construye la tarjeta de datos registrados.
              Container(
                // Agrega espacio interior.
                padding: const EdgeInsets.all(14),

                // Configura la apariencia de la tarjeta.
                decoration: BoxDecoration(
                  // Establece el fondo verde claro.
                  color: verdeClaro,

                  // Dibuja un borde verde.
                  border: Border.all(color: verdeEmpresa),

                  // Redondea las esquinas.
                  borderRadius: BorderRadius.circular(10),
                ), // Finaliza BoxDecoration.

                // Organiza el resultado verticalmente.
                child: Column(
                  // Alinea los textos a la izquierda.
                  crossAxisAlignment: CrossAxisAlignment.start,

                  // Define los elementos de la tarjeta.
                  children: [
                    // Muestra el encabezado del resultado.
                    const Text(
                      // Escribe el título de la tarjeta.
                      'DATOS REGISTRADOS',

                      // Configura el estilo del encabezado.
                      style: TextStyle(
                        // Establece el color verde.
                        color: verdeEmpresa,

                        // Coloca el texto en negrita.
                        fontWeight: FontWeight.bold,
                      ), // Finaliza TextStyle.
                    ), // Finaliza Text.

                    // Agrega un pequeño espacio.
                    const SizedBox(height: 8),

                    // Muestra la información ingresada.
                    Text(
                      // Obtiene los datos guardados.
                      datos!,

                      // Configura el estilo del resultado.
                      style: const TextStyle(
                        // Define el tamaño del texto.
                        fontSize: 13,

                        // Establece el color del texto.
                        color: Colors.black87,

                        // Define la altura de las líneas.
                        height: 1.5,
                      ), // Finaliza TextStyle.
                    ), // Finaliza Text.
                  ], // Finaliza children.
                ), // Finaliza Column.
              ), // Finaliza Container.
          ], // Finaliza children.
        ), // Finaliza Column.
      ), // Finaliza SingleChildScrollView.
    ); // Finaliza Scaffold.
  } // Finaliza build.
} // Finaliza RegistroScreen.
