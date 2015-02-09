# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

opto = Topic.create!(name: 'Optometry')


pre = Section.create!(name: 'Pre-Exam', topic: opto)
exam = Section.create!(name: 'Exam', topic: opto)
postexam = Section.create!(name: 'Post-Exam', topic: opto)

List.create!(name: 'Case History', section: pre)
List.create!(name: 'Preliminaries', section: pre)
List.create!(name: 'Phorias', section: exam)
List.create!(name: 'Ishihara Test Numbers', section: exam)
List.create!(name: 'Helpful Words and Phrases', section: pre)
List.create!(name: 'Follow-Up', section: postexam)
List.create!(name: 'Internals', section: exam)
List.create!(name: 'History', section: pre)
List.create!(name: 'Biomicroscopy', section: exam)
List.create!(name: 'Visual Acuity', section: exam)
List.create!(name: 'Keratometry', section: exam)




