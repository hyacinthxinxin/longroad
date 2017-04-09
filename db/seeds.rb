# frozen_string_literal: true
# This file should contain all the record creation needed to
# seed the database with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#

# User.create!(name: 'fanxin', email: 'fanxin0202@163.com',
#              password: 'aini1234', password_confirmation: 'aini1234',
#              admin: true)

# 5.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n + 1}@163.com"
#   password = 'password'
#   User.create!(name: name, email: email,
#                password: password, password_confirmation: password,
#                admin: false)
# end

device_categories = [['场景', 0], ['灯光', 2], ['窗帘', 3], ['空调', 4], ['地热', 5], ['新风', 6]]
device_categories.each do |category|
  unless DeviceCategory.find_by(device_type: category[1])
    DeviceCategory.create(name: category[0], device_type: category[1])
  end
end

CamCategory.all.each(&:destroy)

cam_categories = [['场景启动', 0, 1], ['灯光开关', 20, 0], ['灯光调光', 21, 1],
                  ['窗帘开', 30, 0], ['窗帘关', 31, 0], ['窗帘升', 32, 0], ['窗帘降', 33, 0], ['窗帘停', 34, 0],
                  ['空调开关', 40, 0], ['空调调温', 41, 2],
                  ['空调风速微风', 72, 1], ['空调风速低风', 73, 1], ['空调风速中风', 74, 1], ['空调风速高风', 75, 1], ['空调风速强风', 76, 1],
                  ['空调模式制热', 42, 1], ['空调模式制冷', 43, 1], ['空调模式通风', 44, 1], ['空调模式除湿', 45, 1],
                  ['地热开关', 50, 0], ['地热调温', 51, 2],
                  ['新风开关', 60, 0],
                  ['新风风速低风', 61, 1], ['新风风速中风', 62, 1], ['新风风速高风', 63, 1]]
cam_categories.each do |category|
  unless CamCategory.find_by(cam_type: category[1])
    CamCategory.create(name: category[0], cam_type: category[1], control_type: category[2])
  end
end

CamCategory.all.order('cam_type ASC').each do |cam_category|
  next if cam_category.device_category
  case cam_category.cam_type
  when 0
    cam_category.device_category = DeviceCategory.find_by(device_type: 0)
  when 20..29
    cam_category.device_category = DeviceCategory.find_by(device_type: 2)
  when 30..39
    cam_category.device_category = DeviceCategory.find_by(device_type: 3)
  when 40..49, 70..79
    cam_category.device_category = DeviceCategory.find_by(device_type: 4)
  when 50..59
    cam_category.device_category = DeviceCategory.find_by(device_type: 5)
  when 60..69
    cam_category.device_category = DeviceCategory.find_by(device_type: 6)
  end
  cam_category.save
end

@ds = Device.all.where('i_type=1')
@ds.each do |d|
  d.i_type = 2
  d.save
end

@cs0 = Cam.all.where('i_type=10')
@cs0.each do |c|
  c.i_type = 20
  c.save
end

@cs1 = Cam.all.where('i_type=46')
@cs1.each do |c|
  c.i_type = 73
  c.save
end

@cs2 = Cam.all.where('i_type=47')
@cs2.each do |c|
  c.i_type = 74
  c.save
end

@cs3 = Cam.all.where('i_type=48')
@cs3.each do |c|
  c.i_type = 75
  c.save
end