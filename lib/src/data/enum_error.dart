

enum EnumResponse {

  okResponse(statusCode: 200, title: _okRequestTitle, detail: _okRequestDetail),
  badResponse(statusCode: 400, title: _badRequestTitle, detail: _badRequestDetail),
  unautorizedReponse(statusCode: 401, title: _unautorizedTitle, detail: _unautorizedDetail),
  notFoundReponse(statusCode: 404, title: _notFoundTitle, detail: _notFoundDetail),
  internalServerErrorReponse(statusCode: 500, title: _internalServerErrorTitle, detail: _internalServerErrorDetail),

  defaultErrorResponse(statusCode: 0, title: _badRequestTitle, detail: _badRequestDetail);
  

  const EnumResponse({
    required this.statusCode,
    required this.title,
    required this.detail,
  });

  final int statusCode;
  final String title;
  final String detail;

}

const String _okRequestTitle = 'Petición exitosa';
const String _okRequestDetail = 'La petición ha sido resuelta con exito.';

const String _badRequestTitle = 'Solicitud incorrecta';
const String _badRequestDetail = 'El servidor no puede procesar una solicitud.';

const String _unautorizedTitle = 'Acceso no autorizado';
const String _unautorizedDetail = 'El servidor denego el acceso debido.';

const String _notFoundTitle = 'Solicitud no encontrada';
const String _notFoundDetail = 'El servidor no puede encontrar el recurso solicitado';

const String _internalServerErrorTitle = 'Error interno del servidor';
const String _internalServerErrorDetail = 'El servidor ha encontrado una situación que no sabe manejar.';