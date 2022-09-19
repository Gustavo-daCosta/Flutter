import 'package:i18n_bytebank/components/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Exemplo de contador utilizando Bloc
// em duas variações
class CounterCubit extends Cubit<int> {
  // Declaração do estado
  CounterCubit() : super(0);

  // o método "emit()" emite uma mudança do estado
  // o "emit()" notifica os builders que a tela precisa ser redesenhada
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

class CounterContainer extends BlocContainer {
  const CounterContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // não sabemos quando devemos redesenhar a tela
    // final state = context.read<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        // ruim pois não sabemos quando rebuildar
        // child: Text(state.toString(), style: textTheme.headline2),

        // é notificado quando deve ser rebuildado
        child: BlocBuilder<CounterCubit, int>(
          builder: ((context, state) {
            return Text(state.toString(), style: textTheme.headline2);
          }),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            // primeira abordagem de como acessar o bloc
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

/*
estado = tipo
a classe é o gerenciador do estado
as funções são eventos

*/