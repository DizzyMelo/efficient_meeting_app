abstract class IRepository<T> {
  T getById();
  List<T> getAll();
  T add(T data);
  T update(T data);
  delete(T data);
}
