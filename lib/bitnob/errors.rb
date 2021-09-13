# frozen_string_literal: true

class BitnobServerError < StandardError
  attr_reader :response

  def initialize(response: nil)
    @response = response
  end
end

class BitnobBadKeyError < StandardError
end

class PermissionError < StandardError
end

class BadRequestError < StandardError
end

class TooManyRequests < StandardError
end

class NotFoundError < StandardError
end

class IncompleteParameterError < StandardError
end

class UnAuthorizedError < StandardError
end
