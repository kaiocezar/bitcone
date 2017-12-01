class Api::V1::LinksController < Api::V1::ApiController

  def start
    hash = params[:wallet_hash]
    user = User.by_whallet_hash(hash)
    cone = Cone.random_avaible
    respond_to do |format|
      format.html { render json: user }
    end
  end

end
