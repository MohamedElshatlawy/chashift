// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_api_provider.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ProfileAPI implements ProfileAPI {
  _ProfileAPI(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://support-grp.com:8001/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponse<String>> uploadProfilePhoto(image) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'file',
        MultipartFile.fromFileSync(image.path,
            filename: image.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(Options(
                method: 'POST', headers: <String, dynamic>{}, extra: _extra)
            .compose(
                _dio.options, '/FreeLancerInfo/UploadFreelancerProfileImage',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
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
