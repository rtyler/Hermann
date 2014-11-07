require 'spec_helper'
require 'hermann/provider/ffi_producer'

describe Hermann::Provider::FFIProducer do
  describe '.initialize' do
    subject(:producer) { described_class.new(brokers) }
    shared_examples_for 'a configuration error' do
      it 'should raise' do
        expect { subject }.to raise_error(Hermann::Errors::ConfigurationError)
      end
    end

    context 'with nil brokers' do
      let(:brokers) { nil }
      it_behaves_like 'a configuration error'
    end

    context 'without host:port pairs' do
      let(:brokers) { 'foo' }
      it_behaves_like 'a configuration error'
    end

    context 'without a numeric port' do
      let(:brokers) { 'rspec:rules' }
      it_behaves_like 'a configuration error'
    end
  end

  context 'instance methods' do
    describe '#connect' do
    end

    describe '#connected?' do
    end

    describe '#errored?' do
    end

    describe '#push_single' do
    end

    describe '#tick' do
    end
  end
end
