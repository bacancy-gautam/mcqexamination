# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
    {
        fname: "Vtsl",
        lname: "Admin",
        mobile: "9876543210",
        email: "admin@admin.com",
        password: "admin@123"
    },
    {
        fname: "Vvv",
        lname: "Mmm",
        mobile: "9876543211",
        email: "faculty@faculty.com",
        password: "faculty",
        branch: "IT",
        status: 1
    },
    {
        fname: "Vatsal",
        lname: "Mewada",
        mobile: "9876543210",
        enrollment: 121212121212,
        sem: 8,
        branch: "IT",
        pyear: 2020,
        email: "student@student.com",
        password: "student"
    },   

])