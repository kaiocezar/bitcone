class Api::V1::LinksController < Api::V1::ApiController
  def start
    hash = params[:wallet_hash]
    user = User.by_whallet_hash(hash).take
    cone = Cone.all.sample
    status = make_money(user, cone)
    respond_to do |format|
      format.html { render json: "{status: #{status}}" }
    end
  end

  private

  def make_money(user, cone)
    if user && cone && cone.links.length < 7 && debit(user, cone)
      Link.create(user: user, cone: cone, position: cone.links.length + 1)
      cone = Cone.find(cone.id)
      break_cone(cone) if cone.links.length == 7
      200
    else
      400
    end
  end

  def break_cone(cone)
    users = cone.users
    if credit(users[0], cone)
      cone_one = Cone.create(price: cone.price)
      Link.create(user: users[1], cone: cone_one, position: 1)
      Link.create(user: users[3], cone: cone_one, position: 2)
      Link.create(user: users[5], cone: cone_one, position: 3)
      cone_two = Cone.create(price: cone.price)
      Link.create(user: users[2], cone: cone_two, position: 1)
      Link.create(user: users[4], cone: cone_two, position: 2)
      Link.create(user: users[6], cone: cone_two, position: 3)
    else
      999
    end
  end

  def balance(user, cone)
    user.balance >= cone.price
  end

  def credit(user, cone)
    user.update(balance: user.balance + (cone.price * 3))
  end

  def debit(user, cone)
    user.update(balance: user.balance - cone.price) if balance(user, cone)
  end
end
