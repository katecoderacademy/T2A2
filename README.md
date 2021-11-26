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
This app  allows the posting of courses by accounts set up for those purposes (taking data for verification purposes such as addresses and telephone numbers). 
For users who just want to attend CPD, more casual users only need to provide limited information so they can track the courses they are interested in. The website is totally open to browsing without a login.

- Functionality / features
1. Secure sign-in facilities that stores passwords securely;
1. post courses and details including their CPD points, as well as a photo of the primary instructor;
2. manage courses through a list which links back to editing them;
3. Review courses and add them to a list of courses to track courses of interest; 

- Sitemap
<<insert sitemap>>

- Screenshots
<<insert screenshots>>

- Target audience
This app is designed for lawyers and other legal professionals who need to do 10 CPD points a year.

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


Administrator

I should be able to view, edit, and delete all courses in FindCPD.
I should be able to lock user accounts so that they are unable to use FindCPD, if so required. I should be able to view a dashboard of all relevant materials, where I can make notes if need be. 
I should also still be able to perform all normal user roles, so that there is less separation between administration and users.





R13	Wireframes for your app

R14	An ERD for your app
<<Insert ERD>>

R15	Explain the different high-level components (abstractions) in your app

The app contains 3 controllers
1. Users Controller (managed by Devise)
    
    Manages user registration and roles and designed to provide authentication. Permissions are managed by way of checkboxes. 
    A basic user requires email, password, first name( ) and last name.
    To gain posting permissions users must be registered as 'instructors' which is done through selecting the 'instructor' checkbox. This can only be selected once the user provides a phone number (on top of other basic information) with this authentication occuring on the controller. 
    The app itself will not allow users to create admins but the database schema allows for the creation of admin users.
    This controller interacts with the addresses model to enable providing of addresses. Eventually the controller should not allow users to post unless they supply one address. 
    There is validation in the model that forces a user to provide first and last names that only use alpha characters and spaces; a unique email with validation on format; a numeric phone number that is between 6 and 20 characters.
    
    
2. Courses Controller
    Manages the posting and indexing of courses. Users can create a course and select a relevant category (from the category mnodel) to index against. This includes a show to show individual courses, the site's index page to show all the courses, an update page, a courses posted page which shows a user all the courses they posted, a new courses page.
    There is validation on the model including title restricting to it between 2 and 100 characters using alphanumeric and punchation; instructor name between 2 and 40 characters alphanumeric and puncuation, instructor role between 2 and 100 characters alphanumeric and puncuation, description between 30 and 4000 characters alphanumeric and puncuation, instructor role between 2 and 100 characters alphanumeric and puncuation, fee which is a number greater than zero or blank (if blank the course is free), numeric fields ethics and professional skills and substantive law and practice_management which can be greater or equal to zero. Both fee and the CPD scores require input masking which is yet to be implimented.  There is also a URL field which is sanitised by way of the "validate_url" gem and can accept up to 150 characters.

Users are prevented from accessing the 'posting' page as even if they do, the controller will redirect them to the homepage


3. Enrollments Controller
    Enrollments allows users to track courses of interest and takes the ID of the user and ID of the course and stores it in its own table. The output of those stored 'enrollments' is displayed on the 'Tracked Courses' page. 

The app contains a further 2 models;

1. category
the category model applies a categories from a pre-defined list to the listing. Category has been created as a seperate model as it would not otherwise be able to apply from a pre-defined list. Further, the intention is that category will become a Categories Controller, to enable search and indexing of courses against those controllers.

2. address
the address model currently does not display due to its nested forms not rendering on either the new course page or users page/s. For the purposes of explaination, it needed to be a distinct editity from Users and Courses, as 
a) at present, an address should be able to be applied to a course OR a user; and
b) eventually, it will likely need a seperate 'states' table so that courses from particular states can be indexed and searched (done by way an Address or States controller); and
c) ideally, the user would have a one-to-many relationship with addresses where they would need to create addresses in their profile to then be able to apply them to the course listing. 

R16	Detail any third party services that your app will use
1. The app currently uses AWS for image storage. The images are stored by way of an S3 private bucket. When a user creates a course, the image is uploded to the bucket. The details and other associated data is stored in the relevant image bucket databases (which have not been included in the ERD). When a course that has an image is shown, this image is then called and AWS S3 serves it back. As the app has no images except for those displayed on course pages of the individual instructors, the AWS calls are only made on the images from the specific courses that have instructor images on them.

Eventually, the app intends to use
2. Mailgun to enable email users of their new accounts, to confirm their email address and thus enable their account, and to email courses of interest to the user so they can keep a record of it in their email for future reference;
3. An address verification service probably using https://addressr.io/ which will provide auto-fill of addresses and also assist in preventing the incorrect entry of address data;
4. A map API to show maps of the addresses on the page, probably Google Maps to show a static map on course pages so that users can see where face-to-face courses are held.


R17	Describe your projects models in terms of the relationships (active record associations) they have with each other



R18	Discuss the database relations to be implemented in your application
R19	Provide your database schema design
<<<INSERT PICTURE>>>


R20	Describe the way tasks are allocated and tracked in your project
<<<INSERT LINK>>>
