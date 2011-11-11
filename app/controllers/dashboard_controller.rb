class DashboardController < ApplicationController
  def index
    @log_text = `tail /var/log/messages | grep opensips`
    @uptime = `opensipsctl fifo uptime`
    @processes = `opensipsctl fifo ps`
    @stats = `opensipsctl fifo get_statistics all`
  end
  def start_server
    `opensipsctl start`
    redirect_to :back
  end
  def stop_server
    `opensipsctl stop`
    redirect_to :back
  end
  def restart_server
    `opensipsctl restart`
    redirect_to :back
  end

end
