// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_offers_api_provider.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _JobOffersAPI implements JobOffersAPI {
  _JobOffersAPI(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://support-grp.com:8001/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponse<List<JobOffer>>> fetchOpportunities() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<JobOffer>>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options,
                    '/OpportunitiesAvailble/GetAllOpportunitiesAvailbleForMob',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<List<JobOffer>>.fromJson(
        _result.data!,
        (json) => (json as List<dynamic>)
            .map<JobOffer>((i) => JobOffer.fromJson(i as Map<String, dynamic>))
            .toList());
    return value;
  }

  @override
  Future<ApiResponse<String>> applyJob(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'Id': id};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        ApiResponse<String>>(Options(
            method: 'GET', headers: <String, dynamic>{}, extra: _extra)
        .compose(_dio.options,
            '/OpportunitiesAvailble/CheckFreeLanceApplyOpportunityAvailbleByIdForMob',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<List<AppliedOffer>>> fetchAppliedOpportunities(
      statusId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'statusId': statusId};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        ApiResponse<List<AppliedOffer>>>(Options(
            method: 'GET', headers: <String, dynamic>{}, extra: _extra)
        .compose(_dio.options,
            '/FreeLanceApplyOpportunities/GetAllFreeLanceApplyOpportunitiesByStatusIdForMob',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<List<AppliedOffer>>.fromJson(
        _result.data!,
        (json) => (json as List<dynamic>)
            .map<AppliedOffer>(
                (i) => AppliedOffer.fromJson(i as Map<String, dynamic>))
            .toList());
    return value;
  }

  @override
  Future<ApiResponse<String>> startShift(shiftParams) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(shiftParams.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(Options(
                method: 'POST', headers: <String, dynamic>{}, extra: _extra)
            .compose(
                _dio.options, '/FreeLanceApplyOpportunities/StartFreeLanceWork',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> finishShift(shiftParams) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(shiftParams.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(Options(
                method: 'POST', headers: <String, dynamic>{}, extra: _extra)
            .compose(
                _dio.options, '/FreeLanceApplyOpportunities/EndFreeLanceWork',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<AppliedOffer>> fetchCurrentShift() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        ApiResponse<AppliedOffer>>(Options(
            method: 'GET', headers: <String, dynamic>{}, extra: _extra)
        .compose(_dio.options,
            '/FreeLanceApplyOpportunities/GetCurrentFreeLanceApplyOpportunitiesForMob',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<AppliedOffer>.fromJson(
      _result.data!,
      (json) => AppliedOffer.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
