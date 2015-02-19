RSpec::Matchers.define :be_accessible do
  match do |server|
    true
  end
  
  chain :user do |user|
    @user = user
  end

  chain :pass do |pass|
    @pass = pass
  end

end

