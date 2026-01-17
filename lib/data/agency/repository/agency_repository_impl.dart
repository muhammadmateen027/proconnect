import 'package:proconnect/data/agency/datasource/agency_remote_data_source.dart';
import 'package:proconnect/domain/agency/repository/agency_repository.dart';
import 'package:proconnect/domain/models/agency.dart';

class AgencyRepositoryImpl implements AgencyRepository {

  AgencyRepositoryImpl(this._remoteDataSource);
  final AgencyRemoteDataSource _remoteDataSource;

  @override
  Future<List<Agency>> getAgencies() async {
    return _remoteDataSource.getAgencies();
  }

  @override
  Future<Agency> getAgencyById(String id) async {
    return _remoteDataSource.getAgencyById(id);
  }

  @override
  Future<Agency> createAgency({
    required String name,
    String? contactEmail,
    String? contactPhone,
    String? address,
  }) async {
    return _remoteDataSource.createAgency(
      name: name,
      contactEmail: contactEmail,
      contactPhone: contactPhone,
      address: address,
    );
  }

  @override
  Future<void> updateAgency(Agency agency) async {
    await _remoteDataSource.updateAgency(agency);
  }

  @override
  Future<void> deleteAgency(String id) async {
    await _remoteDataSource.deleteAgency(id);
  }
}
