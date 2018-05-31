| **ID**   |               M01 |
| -------- | ---------------------: |
| **Asunto** | Propuesta de trabajo |
| **Fecha** | 08/02/2018 - 17:00 |

## Asistentes

- Juan Carlos Pichel Campos
- Diego Rodríguez Martínez
- Cristofer Canosa Domínguez

## Objetivos

Concretar el alcance del trabajo, explicando el algoritmo sobre el que se trabajará.

## Desarrollo

Trabajaremos sobre el proyecto [Pyomo](https://github.com/Pyomo/pyomo), en el módulo *pysp*. 

Se usa *Stochastic Programming* y *Progressive Hedging* para resolver un problema. Es un problema que se puede representar como un árbol que especifica diferentes escenarios interdependientes. Se pueden linearizar los escenarios para ejecutar de forma paralela. Con esto es necesario converger los nodos comunes de los problemas lineales (variabilidad $\rho$).

El trabajo consistirá en adaptar un módulo actual para paralelizar el trabajo utilizando Apache Spark.

## Resultados

Se establecen las siguientes líneas de trabajo para continuar de aquí a una o dos semanas:

- Entender el paradigma del problema.
- Ejecutar el ejemplo *farmer* para establecer la plataforma de programación y entender el proyecto.
- Estudiar la solución actual al problema que debemos adaptar.