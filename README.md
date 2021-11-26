# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.7.2
* Rails version
6.1.4.1

* System dependencies


* Configuration

* Database creation

* Database initialization
Run bin/rails db:setup

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

R1	Create your app using Ruby on Rails.
R2	Use Postgresql database in development and production.
R3	Your app will have authentication (eg. Devise).
R4	Your app will have authorisation (i.e. users have restrictions on what they can see and edit).
R5	Your app will have some type of file (eg. images) uploading capability.
R6	Your app is to be deployed to Heroku (recommended) or AWS.

R7	Identification of the problem you are trying to solve by building this particular marketplace app.

Lawyers need to do 10 units of Continuing Professional Development every year, with 1 point in 4 of each category; Substantive Law, Practice Management, Ethics and Professional Skills. 
The sources for this CPD can vary and there is no central index on the internet for lawyers to find CPD, particularly free CPD. 
This app seeks to resolve this problem. It allows the posting of courses by accounts set up for those purposes (taking data for verification purposes such as addresses and telephone numbers). 
For users who just want to attend CPD, more casual users only need to provide limited information so they can track the courses they are interested in. The website is totally open to browsing without a login.


R8	Why is it a problem that needs solving?
No other website has provided the solution and much of the legal cpd in the world is disbursed.


R9	A link (URL) to your deployed app (i.e. website)
findcpd.herokuapp.com


R10	A link to your GitHub repository (repo).
- https://github.com/katecoderacademy/T2A2/
R11	Description of your marketplace app (website), including:
- Purpose


- Functionality / features
- Sitemap
- Screenshots
- Target audience
- Tech stack (e.g. html, css, deployment platform, etc)
R12	User stories for your app

Website Visitor
I should be able to browse all available courses, and navigate these listings. 
I should be able to select a course, and view it in a dedicated description/view page.

User
I must complete 10 Legal CPD a year in order to maintain my legal certificate. 
I have trouble finding centralised repositories for CPD and often have to subscribe to numerous website mailing lists in order to find current CPD opportunities. 
I want the possibility to browse and find CPD to satisfy requirements in one place for free. I should be able to identify who posted which course/s, so that I can contact them in regards to the course.
On my first visit to FindCPD, I should be redirected to a list of possible CPD opportunities. I should be able to view CPD instructor's profiles, and from there, be able to see all of that users categories/CPD opportunities, and be able to access contact details. 
On seeking to add them to my account, I should be redirected to a page prompting me to sign up as a CPD Consumer. 
Once signed up (and automatically signed in thereafter), I should forcibly be redirected to a page adding the course of interest to my account and show the relevant link to it. 
Until my account is created, I should not be able to track courses. I should be able to track CPD categories, so that I can appropriately organise and find items when using FindCPD.

Instructor
I must not be able to sign up as an instructor unless I provide a telephone number I should be able to create courses with a title, description, fee, its CPD points, image so that courses can be understood and chosen. 
I should be able to assign categories to the course. 
If created by me, I should be able to edit and delete categories and whether the course has been cancelled. I should NOT be able to edit another users profile information, bucket information, or course information.


ADministrator

I should be able to view, edit, and delete all courses in FindCPD.
I should be able to lock user accounts so that they are unable to use FindCPD, if so required. I should be able to view a dashboard of all relevant materials, where I can make notes if need be. 
I should also still be able to perform all normal user roles, so that there is less separation between administration and users.





R13	Wireframes for your app

R14	An ERD for your app
<<Insert ERD>>

R15	Explain the different high-level components (abstractions) in your app

The app contains 3 controllers
1. Users Controller (managed by Devise)
    
    Manages user registration and roles. Permissions are managed by way of checkboxes. 
    A basic user requires email, password, first name( ) and last name
    To gain posting permissions users must be registered as 'instructors' which is done through selecting the 'instructor' checkbox. This can only be selected once the user provides a phone number (on top of other basic information).  
    The app itself will not allow users to create admins but the database schema allows for the creation of admin users.
    This controller interacts with the addresses model
    
2. Courses Controller
    Manages the posting and indexing of courses. 

Users are prevented from accessing the 'posting' page as even if they do, the controller will redirect them to the homepage


3. Enrollments Controller

R16	Detail any third party services that your app will use
R17	Describe your projects models in terms of the relationships (active record associations) they have with each other



R18	Discuss the database relations to be implemented in your application
R19	Provide your database schema design
<<<INSERT PICTURE>>>


R20	Describe the way tasks are allocated and tracked in your project
<<<INSERT LINK>>>
