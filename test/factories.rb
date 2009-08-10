Factory.define :dj_profile do |f|
  f.sequence(:name) {|n| "Some Dude#{n}"}
  f.sequence(:email) {|n| "some.dude#{n}@piratecat.net"}
end
Factory.define :show do |f|
  f.sequence(:name) {|n| "Some Show #{n}"}
  f.description "this show is probably good"
  f.association :owner, :factory=>:dj_profile
end
