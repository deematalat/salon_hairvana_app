import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/client.dart';
import '../../domain/usecases/get_clients.dart';
import '../../data/repositories/client_repository_impl.dart';

// 1. Repository Provider
final clientRepositoryProvider = Provider<ClientRepositoryImpl>((ref) {
  return ClientRepositoryImpl();
});

// 2. Use Case Provider
final getClientsProvider = Provider<GetClients>((ref) {
  final repository = ref.watch(clientRepositoryProvider);
  return GetClients(repository);
});

// 3. State Notifier Provider for the screen
final clientsProvider = StateNotifierProvider<ClientsNotifier, List<Client>>((ref) {
  final getClients = ref.watch(getClientsProvider);
  return ClientsNotifier(getClients);
});

class ClientsNotifier extends StateNotifier<List<Client>> {
  final GetClients _getClients;

  ClientsNotifier(this._getClients) : super([]) {
    loadClients();
  }

  Future<void> loadClients() async {
    final clients = await _getClients();
    state = clients;
  }
} 