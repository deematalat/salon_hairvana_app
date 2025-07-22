import '../../domain/entities/client.dart';
import '../../domain/repositories/client_repository.dart';

class ClientRepositoryImpl implements ClientRepository {
  @override
  Future<List<Client>> getClients() async {
    // In a real app, this would be an API call or a database query.
    return [
      const Client(initials: 'AS', name: 'Alice Smith', lastVisit: '2 weeks ago'),
      const Client(initials: 'BJ', name: 'Bob Johnson', lastVisit: '1 month ago'),
      // Add more sample clients here.
    ];
  }
} 