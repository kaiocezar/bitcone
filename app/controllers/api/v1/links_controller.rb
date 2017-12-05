class Api::V1::LinksController < Api::V1::ApiController

  def start
    hash = params[:wallet_hash]
    user = User.by_whallet_hash(hash)
    cone = Cone.all.sample
    if user && cone
      if cone.users.length < 7
        cone.users << user
      else
        # break
      end
    end
    respond_to do |format|
      format.html { render json: cone.links }
    end
  end

end
