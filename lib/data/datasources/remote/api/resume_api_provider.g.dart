// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_api_provider.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ResumeAPI implements ResumeAPI {
  _ResumeAPI(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://support-grp.com:8001/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponse<Resume>> updateResume(updateResumeParams) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateResumeParams.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<Resume>>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/FreeLancerInfo/UpdateFreeLancerCV',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<Resume>.fromJson(
      _result.data!,
      (json) => Resume.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<Resume>> fetchResume() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<Resume>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/FreeLancerInfo/GetFreeLanceLoginCV',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<Resume>.fromJson(
      _result.data!,
      (json) => Resume.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<LevelItem>>> fetchLevels() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<LevelItem>>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/FreeLancerInfo/GetAllLevels',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<List<LevelItem>>.fromJson(
        _result.data!,
        (json) => (json as List<dynamic>)
            .map<LevelItem>(
                (i) => LevelItem.fromJson(i as Map<String, dynamic>))
            .toList());
    return value;
  }

  @override
  Future<ApiResponse<List<CityItem>>> fetchAllCities() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<CityItem>>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/City/GetAllCities',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<List<CityItem>>.fromJson(
        _result.data!,
        (json) => (json as List<dynamic>)
            .map<CityItem>((i) => CityItem.fromJson(i as Map<String, dynamic>))
            .toList());
    return value;
  }

  @override
  Future<ApiResponse<List<QualificationItem>>> fetchQualifications() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<QualificationItem>>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(
                    _dio.options, '/Qualification/GetAllQualificationForDrop',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<List<QualificationItem>>.fromJson(
        _result.data!,
        (json) => (json as List<dynamic>)
            .map<QualificationItem>(
                (i) => QualificationItem.fromJson(i as Map<String, dynamic>))
            .toList());
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
