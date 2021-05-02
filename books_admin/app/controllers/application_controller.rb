class ApplicationController < ActionController::Base
  rescue_from LoginFailed, with: :login_failed # LoginFailed例外が発生したらlogin_failedメソッドを呼び出してrescue

  def login_failed
    render template: "shared/login_failed", status: 401 # 401コードとともにlogin_failedテンプレートを返す
  end
end
