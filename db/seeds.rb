# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Branch.create([
                {
                  name: 'IT'
                },
                {
                  name: 'CE'
                },
                {
                  name: 'PE'
                }
              ])

Semester.create([
                  {
                    sem: 1
                  },
                  {
                    sem: 2
                  },
                  {
                    sem: 3
                  },
                  {
                    sem: 4
                  },
                  {
                    sem: 5
                  },
                  {
                    sem: 6
                  },
                  {
                    sem: 7
                  },
                  {
                    sem: 8
                  }
                ])

User.create([
              {
                fname: 'Vtsl',
                lname: 'Admin',
                mobile: '9876543210',
                email: 'admin@admin.com',
                password: 'admin@123'
              },
              {
                fname: 'Vvv',
                lname: 'Mmm',
                mobile: '9876543211',
                email: 'faculty@faculty.com',
                password: 'faculty',
                branch_id: 1,
                status: 1
              },
              {
                fname: 'Vatsal',
                lname: 'Mewada',
                mobile: '9876543210',
                enrollment: 121_212_121_212,
                semester_id: 8,
                branch_id: 1,
                pass_out_year: 2020,
                email: 'student@student.com',
                password: 'student'
              }

            ])
