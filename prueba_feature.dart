class string_state {
  string_state();
}

class string_loading extends string_state {
  string_loading();
}

class string_new extends string_state {
  String data;
  string_new({required this.data});

  List<Object> get props => [data];
}

class pago_error extends string_state {
  String message;
  pago_error({required this.message});
  List<Object> get props => [message];
}
