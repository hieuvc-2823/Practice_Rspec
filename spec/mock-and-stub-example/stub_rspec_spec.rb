class Payment
  attr_accessor :total_cents

  def initialize(payment_gateway, logger)
    @payment_gateway = payment_gateway
    @logger = logger
  end

  def save
    response = @payment_gateway.charge(total_cents)
    @logger.record_payment(response[:payment_id])
  end
end

class PaymentGateway
  def charge(total_cents)
    puts "THIS HITS THE PRODUCTION API AND ALTERS PRODUCTION DATA. THAT'S BAD!"

    { payment_id: rand(1000) }
  end
end

class Logger
  def record_payment(payment_id)
    puts "Payment id: #{payment_id}"
  end
end

describe Payment do
  it 'records the payment' do
    payment_gateway = double()
    allow(payment_gateway).to receive(:charge).and_return(payment_id: 1234)

    logger = Logger.new

    payment = Payment.new(payment_gateway, logger)
    payment.total_cents = 1800
    payment.save
  end
end

# // Explain result
# If we run this test now, we can see that we no longer get the jarring “THIS HITS THE PRODUCTION API” message. This is because our test no longer calls the charge method on an instance of PaymentGateway, it calls the charge method on a test double.

# Our payment_gateway variable is no longer actually an instance of PaymentGateway, it’s an instance of RSpec::Mocks::Double.
