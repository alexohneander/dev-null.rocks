require "powerdns"

class ZonesController < ApplicationController
  before_action :authenticate_user!

  def index
    api_instance = PowerDNS::ZonesApi.new
    server_id = "localhost"

    result = api_instance.list_zones(server_id)
    zones = result.select { |zone| zone.account == current_user.username }

    puts zones

    @zones = zones
  end
end
