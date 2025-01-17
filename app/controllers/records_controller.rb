class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    api_instance = PowerDNS::ZonesApi.new
    server_id = "localhost"
    zone_id = "wellcom.rocks."

    result = api_instance.list_zone(server_id, zone_id)

    @records = result.rrsets
  end
end
