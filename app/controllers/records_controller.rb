require "base64"

class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:zone_id] != ""
      api_instance = PowerDNS::ZonesApi.new
      server_id = "localhost"
      zone_id_encoded = params[:zone_id]
      zone_id = Base64.decode64(zone_id_encoded)

      result = api_instance.list_zone(server_id, zone_id)
      records = result.rrsets
      puts records

      @records = records
    else
      redirect_to "/dashboard/zones"
    end
  end
end
