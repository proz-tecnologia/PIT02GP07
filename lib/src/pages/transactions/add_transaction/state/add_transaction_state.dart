abstract class AddTransactionState {
  const AddTransactionState();
}

class AddTransactionStateEmpty extends AddTransactionState {}

class AddTransactionStateLoading extends AddTransactionState {}

class AddTransactionStateSuccess extends AddTransactionState {}

class AddCategoryStateSuccess extends AddTransactionState {}

class AddTransactionStateError extends AddTransactionState {
  final Exception exception;

  const AddTransactionStateError({
    required this.exception
  });
}
