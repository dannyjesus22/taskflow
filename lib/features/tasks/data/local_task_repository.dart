import '../domain/task.dart';
import 'task_repository.dart';

class LocalTaskRepository implements TaskRepository {
  final List<Task> _tasks = [
    const Task(
      id: 1,
      title: 'Entregar PAE de Flutter',
      description: 'Subir el repositorio de TaskFlow a la plataforma',
      priority: 'Alta',
      isCompleted: true,
      userId: 1,
    ),
    const Task(
      id: 2,
      title: 'Estudiar para el parcial',
      description: 'Repasar widgets, estado y navegación',
      priority: 'Alta',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 3,
      title: 'Preparar la exposición',
      description: 'Armar diapositivas y practicar la presentación',
      priority: 'Media',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 4,
      title: 'Leer material de la sesión',
      description: 'Revisar la documentación de go_router',
      priority: 'Media',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 5,
      title: 'Ordenar apuntes',
      description: 'Organizar las notas de la semana',
      priority: 'Baja',
      isCompleted: false,
      userId: 1,
    ),
  ];

  @override
  List<Task> getTasks() => List.unmodifiable(_tasks);

  @override
  void save(Task task) {
    final index = _tasks.indexWhere((item) => item.id == task.id);
    if (index == -1) return;
    _tasks[index] = task;
  }
}
