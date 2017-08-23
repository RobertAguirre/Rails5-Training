class DemoController < ApplicationController

  layout false

  def index
    render('index')
  end

  def hello
    render('hello')
  end

  def other_hello
    redirect_to(:action => 'hello')
  end

  def google
    redirect_to('http://google.com')
  end

end
