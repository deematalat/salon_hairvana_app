import '../entities/client.dart';
 
abstract class ClientRepository {
  Future<List<Client>> getClients();
} 