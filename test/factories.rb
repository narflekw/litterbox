Factory.define :user do |f|
  f.role "DJ" # or Intern or ...?
  f.sequence(:email) {|n| "some.real.dude#{n}@real_email.com"}
  f.sequence(:name) {|n| "Real Dude#{n}"}
end
Factory.define :dj_profile do |f|
  f.association :user, :factory=>:user
  f.sequence(:name) {|n| "Some DJ#{n}"}
  f.sequence(:email) {|n| "some.dj#{n}@piratecat.net"}
  f.twitter_id ""
  f.facebook_url ""
end
Factory.define :show do |f|
  f.sequence(:name) {|n| "Some Show #{n}"}
  f.description "this show is probably good"
  f.association :owner, :factory=>:dj_profile
end
