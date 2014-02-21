# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "START SEEDING (this might take a while)"

f = File.open(Rails.root + "db/courses.xml")
doc = Nokogiri::XML(f) do |config|
	config.noent
end
f.close

courses = doc.xpath("/courses/course").to_a

courses.first(300).each do |course|
	acode = course.xpath("@acode").to_s
	code = course.xpath("@code").to_s
	sgid = course.xpath("@sgid").to_s
	name = course.xpath("name").text
	ects = course.xpath("ects").text
	year = course.xpath("year").text
	period = course.xpath("period").text
	institute = course.xpath("institute").text

	staff = course.xpath("staff_list/staff").to_a

	programme = course.xpath("programmes/programme").to_a

	description = Sanitize.clean(course.xpath("description").text)
	timetable = Sanitize.clean(course.xpath("timetable").text)
	lecture_material = Sanitize.clean(course.xpath("lecture_material").text)
	goals = Sanitize.clean(course.xpath("goals").text)
	participant_count = Sanitize.clean(course.xpath("participant_count").text)
	specialities = Sanitize.clean(course.xpath("specialities").text)
	examination = Sanitize.clean(course.xpath("examination").text)


	newcourse = Course.new do |c|
		c.acode = acode
		c.code = code
		c.sgid = sgid
		c.name = name
		c.ects = ects
		c.year = year
		c.period = period
		c.description = description
		c.timetable = timetable
		c.lecture_material = lecture_material
		c.goals = goals
		c.participant_count = participant_count
		c.specialities = specialities
		c.examination = examination
	end
	newcourse.save

	new_institute = Institute.find_or_create_by_name(institute)
	newcourse.institutes << new_institute

	staff.each do |i|
		staff_name = i.xpath("name/text()").to_s
		staff_url = i.xpath("url/text()").to_s
		new_staff = Staff.find_or_create_by_name_and_url(staff_name, staff_url)
		newcourse.staffs << new_staff
	end

	programme.each do |i|
		programme_name = i.xpath("name/text()").to_s
		programme_url = i.xpath("url/text()").to_s
		new_programme = Programme.find_or_create_by_name_and_url(programme_name, programme_url)
		newcourse.programmes << new_programme
	end
end
puts "FINISHED SEEDING"