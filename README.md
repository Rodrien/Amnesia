# Amnesia Password Manager
Gestor de contraseñas opensource creado con Flutter. 

## Funcionalidades 
- Facildiad de uso
- Almacenamiento local
- Encriptacion (proximamente)

## Snapshots
<img src="/Snapshots/Ejemplo11.png">
<img src="/Snapshots/Ejemplo12.png">
<img src="/Snapshots/Ejemplo13.png">

## Como utilizar
- Para agregar entradas es bastante directo, al darle al + se abre la pagina para escribir los datos y elegir el logo.
- Para eliminar una entrada es tan facil como hacerle "swipe" hacia la derecha a la entrada que desea eliminar.
- Para actualizar una entrada es tan facil como hacerle "swipe" hacia la izquierda a la entrada que desea actualizar y luego cambiar los datos de la misma.
- Al tocar el ojo de arriba se muestran todas las contraseñas.
- Al aguantar una de las tarjetas, la contraseña de la misma se nos copia automaticamente al portapapeles para luego pegarla en la pagina de la misma o donde nosotros querramos, sin la necesidad de ver la contraseña en si.

<!-- 
## A actualizar/agregar/cambiar
- Armar pagina principal con autenticacion de contraseña 
- Add list tile on tap feedback
- Actualizar logo
- Agregar favoritos (bool en base de datos posiblemente) <-- ya se agrego como un integer, cuando vale 1 es que es fav
    Para cargar la lista con los favs primero utilizar instrucciones SQL (WHERE favorito = 1)

- Agregar un generador de contraseñas
- Agregar light theme (un color cremita quizas, con accentos blancos, mas profesional)
- Armar pagina principal con autenticacion de contraseña ()
- Agregar encriptacion de las contraseñas (https://pub.dev/packages/encrypt,https://pub.dev/packages/aes_crypt)
-->

<!-- 
COMANDOS UTILES
- Actualizar el icono de la app
    flutter pub run flutter_launcher_icons:main
- Crear el APK
    flutter build apk --split-per-abi (en la raiz del directorio)
-->