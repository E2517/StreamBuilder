# streambuilder

Stream Builder. Check ConnectionState is not working

## Getting Started

Tanto StreamBuilder como FutureBuilder tienen el mismo comportamiento: escuchan los cambios en sus respectivos objetos. Y desencadenar una nueva compilación cuando se les notifica un nuevo valor.

Future son como Promise en JS. Son la representación de una solicitud asincrónica. Futures tiene una y solo una respuesta. Un uso común de Future es manejar llamadas http. Lo que puedes escuchar en un Future es su estado. Ya sea que haya terminado, haya terminado con éxito o haya tenido un error. Pero eso es todo.

Un Future no puede escuchar un cambio de variable. Es una respuesta única. En su lugar, deberá usar un Stream.

Stream por otro lado son como asíncronos Iterator en JS. Esto puede asimilarse a un valor que puede cambiar con el tiempo. Por lo general, es la representación de sockets web o eventos (como un clic). Al escuchar un Stream obtendrá cada nuevo valor y también si el Stream tuvo un error o se completó.

- [StreamBuilder](https://www.youtube.com/watch?v=MkKEWHfy99Y)

