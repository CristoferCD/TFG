| **ID**   |               M02 |
| -------- | ---------------------: |
| **Asunto** | Resolver problemas de persistencia en Spark |
| **Fecha** | 29/05/2018 - 11:00 |

## Asistentes

- Juan Carlos Pichel Campos
- Cristofer Canosa Domínguez

## Objetivos

Solucionar un problema de persistencia de los datos en la implementación inicial de *phspark*.

## Desarrollo

Analizando la implementación, se confirma que el uso de Spark es correcto.

Revisamos el contenido de los *workers* para confirmar que, entre iteraciones, los datos no se preservan correctamente.

Debemos buscar la sincronización correcta de los datos con el *master* en cada iteración, pero el intento actual no funciona correctamente.

## Resultados

Se deberá implementar correctamente la sincronización de los datos ente el master y los *workers*. Es de especial importancia el comportamiento de la iteración 0.
