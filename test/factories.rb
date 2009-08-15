Factory.define :user do |f|
  f.role "DJ" # or Intern or ...?
  f.sequence(:email) {|n| "some.real.dude#{n}@real_email.com"}
  f.sequence(:name) {|n| "Real Dude#{n}"}
end
Factory.define :dj_profile do |f|
  f.association :user, :factory=>:user
  f.sequence(:name) {|n| "Some Dude#{n}"}
  f.sequence(:email) {|n| "some.dude#{n}@piratecat.net"}
end
Factory.define :show do |f|
  f.sequence(:name) {|n| "Some Show #{n}"}
  f.description "this show is probably good"
  f.association :owner, :factory=>:dj_profile
end
