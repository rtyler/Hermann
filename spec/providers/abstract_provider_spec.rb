require 'spec_helper'
require 'hermann/provider/abstract_producer'

describe Hermann::Provider::AbstractProducer do
  it { should respond_to :connected? }
  it { should respond_to :errored? }
  it { should respond_to :connect }
  it { should respond_to :push_single }
  it { should respond_to :tick }
end
