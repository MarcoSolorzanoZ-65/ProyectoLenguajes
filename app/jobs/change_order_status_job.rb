# app/jobs/change_order_status_job.rb
class ChangeOrderStatusJob < ApplicationJob
  queue_as :default

  MAX_PERFORM_COUNT = 5

  def perform(order_id, perform_count = 1)
    order = Order.find(order_id)
    current_status = order.order_status

    # Skip status 4 and go directly to 5 if the current status is not 4
    next_status = current_status == 4 ? current_status : current_status + 1

    # Update the order status
    order.update(order_status: next_status)

    # Re-enqueue the job to run again after 5 minutes if the new status is less than 5
    if next_status != 5 && perform_count < MAX_PERFORM_COUNT
      self.class.set(wait: 5.minutes).perform_later(order_id, perform_count + 1)
    end
  end
end
