Spree::Order.class_eval do
  def cash_on_delivery_payment?
    payment && payment.payment_method.is_a?(Spree::CashOnDelivery::PaymentMethod)
  end

  def cash_on_delivery_adjustment
    if cash_on_delivery_payment?
      adjustments.detect{|adj| adj.originator == payment.payment_method}
    end
  end
end
