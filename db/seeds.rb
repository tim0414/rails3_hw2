# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tim = User.create(name:"tim", email:"tim@example.com")
john = User.create(name:"john", email:"john@example.com")
andy = User.create(name:"andy", email:"andy@example.com")
leo = User.create(name:"leo", email: "leo@example.com")
paul = User.create(name:"paul", email:"paul@example.com")

cam1 = Camera.create(name:"c1", user_id:tim.id)
cam2 = Camera.create(name:"c2", user_id:tim.id)
cam3 = Camera.create(name:"c3", user_id:tim.id)
cam4 = Camera.create(name:"c4", user_id:john.id)
cam5 = Camera.create(name:"c5", user_id:john.id)
cam6 = Camera.create(name:"c6", user_id:andy.id)
cam7 = Camera.create(name:"c7", user_id:leo.id)
cam8 = Camera.create(name:"c8", user_id:paul.id)

sub1 = Subscribe.create(owner_id:tim.id, subscriber_id:john.id, nickname: "john@tim_cam")
sub2 = Subscribe.create(owner_id:tim.id, subscriber_id:andy.id, nickname: "andy@tim_cam")
sub3 = Subscribe.create(owner_id:andy.id, subscriber_id:tim.id, nickname: "tim@andy_cam")
sub4 = Subscribe.create(owner_id:leo.id, subscriber_id:tim.id, nickname: "tim@leo_cam")
sub5 = Subscribe.create(owner_id:andy.id, subscriber_id:paul.id, nickname: "paul@andy")
sub6 = Subscribe.create(owner_id:paul.id, subscriber_id:leo.id, nickname: "leo@paul")

Share.create(camera_id:cam8.id, subscribe_id:sub6.id)
Share.create(camera_id:cam1.id, subscribe_id:sub1.id)
Share.create(camera_id:cam1.id, subscribe_id:sub2.id)
Share.create(camera_id:cam6.id, subscribe_id:sub5.id)
Share.create(camera_id:cam7.id, subscribe_id:sub4.id)

