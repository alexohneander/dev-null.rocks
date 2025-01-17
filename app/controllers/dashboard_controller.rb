require "powerdns"

class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    Rails.logger.info(event: "user logged in")

    api_instance = PowerDNS::StatsApi.new
    server_id = "localhost"
    result = api_instance.get_stats(server_id)

    @stats_backend_queries = result[1]
    @stats_cached_keys = result[16]
    @stats_cache_hits = result[23]
    @stats_cache_miss = result[24]
    @stats_latency = result[17]

    stuff = result[24]
    puts stuff

    @stuff = stuff
  end
end
