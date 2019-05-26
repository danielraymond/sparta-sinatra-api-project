require_relative 'services/neo_current_date_service'

class NEOAPI

  def neo_current_date_service
    NEOCurrentDateService.new
  end

end
