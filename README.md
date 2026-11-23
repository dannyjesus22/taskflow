## Alcance de TaskFlow

Problema: necesito organizar actividades académicas y saber cuáles faltan.
Usuario objetivo: estudiante que planifica entregas semanales.

### Historias de usuario y criterios de aceptación
1. Como estudiante, quiero listar mis tareas para ver qué debo hacer.
   Criterio: la lista muestra título, prioridad y estado de cada tarea.
2. Como estudiante, quiero abrir una tarea para leer su descripción.
   Criterio: al tocar una tarjeta aparece el detalle de la tarea elegida.
3. Como estudiante, quiero crear una tarea para registrar un pendiente.
   Criterio: el formulario guarda una tarea válida y la lista la muestra.
4. Como estudiante, quiero editar una tarea para corregir sus datos.
   Criterio: los cambios guardados aparecen en lista y detalle.
5. Como estudiante, quiero eliminar una tarea terminada para limpiar la lista.
   Criterio: después de confirmar, la tarea desaparece de la lista.

### Modelo de datos
Task: id (entero único), title (texto), description (texto),
priority (Alta, Media o Baja), isCompleted (verdadero/falso),
userId (entero que identifica al usuario de prueba).

### Pantallas previstas
Lista: tarjetas de tareas y acción para crear.
Detalle: información completa y futuras acciones de editar o eliminar.
Formulario: campos de título, descripción y prioridad.

### Requisitos no funcionales
La navegación debe tener textos comprensibles.
Un id inexistente debe mostrar un mensaje en vez de cerrar la app.

### Contrato de API que necesitaremos
GET /tasks        listar tareas
GET /tasks/:id    consultar detalle
POST /tasks       crear tarea
PATCH /tasks/:id  actualizar tarea
DELETE /tasks/:id eliminar tarea

La API concreta se elegirá después. Estas rutas son requisitos, no
direcciones de un servidor ya conectado.

////////////////////////////////////////////

## API de tareas

TaskFlow consulta las tareas a JSONPlaceholder, una API pública de datos de prueba.

- URL exacta: `GET https://jsonplaceholder.typicode.com/todos?userId=2`
- Parámetro: `userId=2` (constante `userId` en `TaskApiService`). Filtra las tareas del usuario 2.
- Campos que llegan: `userId`, `id`, `title` y `completed`.
- Valores que TaskFlow completa por defecto, porque la API no los entrega:
  - `description`: "Sin descripción (API)"
  - `priority`: "Sin prioridad (API)"
- `completed` de la API se convierte en `isCompleted` del modelo `Task`.
- Marcar una tarea como completada es **local**: solo cambia la copia en memoria.
  La API de práctica no guarda cambios, así que al reiniciar la app vuelve al valor original.

Recorrido de los datos: `main.dart` → `TasksViewModel` → `RemoteTaskRepository` →
`TaskApiService` (Dio, GET) → `Task.fromJson()` → `notifyListeners()` → lista y detalle.