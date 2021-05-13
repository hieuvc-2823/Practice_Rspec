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
    payment_gateway = PaymentGateway.new
    logger = Logger.new

    payment = Payment.new(payment_gateway, logger)
    payment.total_cents = 1800
    payment.save
  end
end

# // Problem
# One is that it hits the real production API and alters production data. (My code doesn’t really do this; you can pretend that my puts statement hits a real payment gateway and charges somebody’s credit card.)

# The other problem is that the test doesn’t verify that the payment gets logged. We could comment out the @logger.record_payment(response[:payment_id]) line and the test would still pass.
