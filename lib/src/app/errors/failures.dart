abstract class Failure {}

class AppFailure extends Failure {}

class ResponseFailure extends Failure {}

class ConnectionFailure extends Failure {}

class NotAuthorizedFailure extends Failure {}

class NotFoundFailure extends Failure {}

class InternalServeFailure extends Failure {}
