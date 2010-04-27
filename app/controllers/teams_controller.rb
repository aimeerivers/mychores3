class TeamsController < ResourceController::Base
  before_filter :sign_in_required, :except => [:show]
  show do
    failure.wants.html { not_found }
  end
end
