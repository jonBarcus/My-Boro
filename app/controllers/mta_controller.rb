require 'scrapers/mta_api'

class MtaController < ApplicationController

  def show
    mta = BoroMTA.new(params[:location])
    response = {
      current_lines: mta[0],
      current_status: mta[1]
    }

    render :json => {current_lines: response[:current_lines],
                     current_status: response[:current_status]
                   }

  end

end
