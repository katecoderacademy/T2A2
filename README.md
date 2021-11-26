# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.7.2
* Rails version
6.1.4.1

* Database initialization
Run bin/rails db:setup

## R7	Identification of the problem you are trying to solve by building this particular marketplace app.

Lawyers need to do 10 units of Continuing Professional Development every year, with 1 point in 4 of each category; Substantive Law, Practice Management, Ethics and Professional Skills. 
The sources for this CPD can vary and there is no central index on the internet for lawyers to find CPD, particularly free CPD. 
This app seeks to resolve this problem. It allows the posting of courses by accounts set up for those purposes (taking data for verification purposes such as addresses and telephone numbers). 
For users who just want to attend CPD, more casual users only need to provide limited information so they can track the courses they are interested in. The website is totally open to browsing without a login.


## R8	Why is it a problem that needs solving?
No other website has provided the solution and much of the legal CPD on the internet is disbursed among many different websites. It will save lawyers time to find it all in one place and hopefully encourage competition among providers to enable better quality CPD and more free options.


## R9	A link (URL) to your deployed app (i.e. website)
findcpd.herokuapp.com


## R10	A link to your GitHub repository (repo).
- https://github.com/katecoderacademy/T2A2/
R11	Description of your marketplace app (website), including:
- Purpose
This app allows the posting of courses by accounts set up for those purposes (taking data for verification purposes such as addresses and telephone numbers). 
For users who just want to attend CPD, more casual users only need to provide limited information so they can track the courses they are interested in. The website is totally open to browsing without a login.

- Functionality / features
1. Secure sign-in facilities that stores passwords securely;
1. post courses and details including their CPD points, as well as a photo of the primary instructor;
2. manage courses through a list which links back to editing them;
3. Review courses and add them to a list of courses to track courses of interest; 

- Sitemap
![Sitemap](./docs/sitemap.png)

- Screenshots
![Index](./docs/index-d.png)
![Index](./docs/index-t.png)
![Index](./docs/index-p.png)
![Add Course](./docs/add-course-d.png)
![Add Course](./docs/add-course-t.png)
![Add Course](./docs/add-course-p.png)
![Edit User](./docs/edit-user-d.png)
![Edit User](./docs/edit-user-t.png)
![Edit User](./docs/edit-user-p.png)
![Posted Courses](./docs/posted-courses-d.png)
![Posted Courses](./docs/posted-courses-t.png)
![Posted Courses](./docs/posted-courses-p.png)
![Sign up](./docs/sign-up-d.png)
![Sign up](./docs/sign-up-t.png)
![Sign up](./docs/sign-up-p.png)
![Tracked Courses](./docs/tracked-courses-d.png)
![Tracked Courses](./docs/tracked-courses-t.png)
![Tracked Courses](./docs/tracked-courses-p.png)

- Target audience
This app is designed for lawyers and other legal professionals who need to do 10 CPD points a year.
It is also designed for course providers to advertise their course.

- Tech stack (e.g. html, css, deployment platform, etc)
- HTML
- CSS
- Heroku
- Bootstrap
- jQuery-Mask-Plugin
- AWS for image hosting
- gems - Devise, validate_url, 


## R12	User stories for your app

### Website Visitor
I should be able to browse all available courses, and navigate these listings. 
I should be able to select a course, and view it in a dedicated description/view page.

### User
I must complete 10 Legal CPD a year in order to maintain my legal certificate. 
I have trouble finding centralised repositories for CPD and often have to subscribe to numerous website mailing lists in order to find current CPD opportunities. 
I want the possibility to browse and find CPD to satisfy requirements in one place for free. I should be able to identify who posted which course/s, so that I can contact them in regards to the course.
On my first visit to FindCPD, I should be redirected to a list of possible CPD opportunities. I should be able to view CPD instructor's profiles, and from there, be able to see all of that users categories/CPD opportunities, and be able to access contact details. 
On seeking to add them to my account, I should be redirected to a page prompting me to sign up as a CPD Consumer. 
Once signed up (and automatically signed in thereafter), I should forcibly be redirected to a page adding the course of interest to my account and show the relevant link to it. 
Until my account is created, I should not be able to track courses. I should be able to track CPD categories, so that I can appropriately organise and find items when using FindCPD.

### Instructor
I must not be able to sign up as an instructor unless I provide a telephone number I should be able to create courses with a title, description, fee, its CPD points, image so that courses can be understood and chosen. 
I should be able to assign categories to the course. 
If created by me, I should be able to edit and delete categories and whether the course has been cancelled. I should NOT be able to edit another users profile information, bucket information, or course information.


### Administrator

I should be able to view, edit, and delete all courses in FindCPD.
I should be able to lock user accounts so that they are unable to use FindCPD, if so required. I should be able to view a dashboard of all relevant materials, where I can make notes if need be. 
I should also still be able to perform all normal user roles, so that there is less separation between administration and users.





R13	Wireframes for your app

R14	An ERD for your app
![Edit Course](./docs/edit-course-w.png)
![Index](./docs/index-w.png)
![Add Course](./docs/add-course-w.png)
![Edit User](./docs/edit-user-w.png)
![View Course](./docs/view-courses-w.png)
![Tracked Courses](./docs/tracked-courses-w.png)
![Sign Up](./docs/sign-up-w.png)

## R15	Explain the different high-level components (abstractions) in your app

The app contains 3 controllers
1. Users Controller (managed by Devise)
    
    Manages user registration and roles and designed to provide authentication. Permissions are managed by way of checkboxes. 
    A basic user requires email, password, first name and last name.
    To gain posting permissions users must be registered as 'instructors' which is done through selecting the 'instructor' checkbox. This can only be selected once the user provides a phone number (on top of other basic information) with this authentication occurring on the controller. 
    The app itself will not allow users to create admins but the database schema allows for the creation of admin users.
    This controller interacts with the addresses model to enable providing of addresses. Eventually the controller should not allow users to post unless they supply one address. 
    There is validation in the model that forces a user to provide first and last names that only use alpha characters and spaces; a unique email with validation on format; a numeric phone number that is between 6 and 20 characters.

    
    
2. Courses Controller
       Manages the posting and indexing of courses. Users can create a course and select a relevant category (from the category model) to index ## against. This includes a show to show individual courses, the site's index page to show all the courses, an update page, a courses posted page which shows a user all the courses they posted, a new courses page.
    There is validation on the model including title restricting to it between 2 and 100 characters using alphanumeric and punctuation; instructor name between 2 and 40 characters alphanumeric and punctuation, instructor role between 2 and 100 characters alphanumeric and punctuation, description between 30 and 4000 characters alphanumeric and punctuation, instructor role between 2 and 100 characters alphanumeric and punctuation, fee which is a number greater than zero or blank (if blank the course is free), numeric fields ethics and professional skills and substantive law and practice_management which can be greater or equal to zero. Both fee and the CPD scores require input masking which is yet to be implemented.  There is also a URL field which is sanitised by way of the "validate_url" gem and can accept up to 150 characters. 


3. Enrollments Controller
    Enrollments (sic) allows users to track courses of interest and takes the ID of the user and ID of the course and stores it in its own table. The output of those stored 'enrollments' is displayed on the 'Tracked Courses' page. 

The app contains a further 2 models;

1. Category
the category model applies a categories from a pre-defined list to the listing. Category has been created as a separate model as it would not otherwise be able to apply from a pre-defined list. Further, the intention is that category will become a Categories Controller, to enable search and indexing of courses against those controllers.

2. Address
the address model currently does not display due to its nested forms not rendering on either the new course page or users page/s. For the purposes of explanation, it needed to be a distinct entity from Users and Courses, as 
a) at present, an address should be able to be applied to a course OR a user; and
b) eventually, it will likely need a separate 'states' table so that courses from particular states can be indexed and searched (done by way an Address or States controller); and
c) ideally, the user would have a one-to-many relationship with addresses where they would need to create addresses in their profile to then be able to apply them to the course listing. 


## R16	Detail any third party services that your app will use
1. The app currently uses AWS for image storage. The images are stored by way of an S3 private bucket. When a user creates a course, the image is uploaded to the bucket. The details and other associated data is stored in the relevant image bucket databases (which have not been included in the ERD). When a course that has an image is shown, this image is then called and AWS S3 serves it back. As the app has no images except for those displayed on course pages of the individual instructors, the AWS calls are only made on the images from the specific courses that have instructor images on them.

Eventually, the app intends to use
2. Mailgun to enable email users of their new accounts, to confirm their email address and thus enable their account, and to email courses of interest to the user so they can keep a record of it in their email for future reference;
3. An address verification service probably using https://addressr.io/ which will provide auto-fill of addresses and also assist in preventing the incorrect entry of address data;
4. A map API to show maps of the addresses on the page, probably Google Maps to show a static map on course pages so that users can see where face-to-face courses are held.



## R17	Describe your projects models in terms of the relationships (active record associations) they have with each other
1. Users
    Users can create many courses, subject to validation on the user account. This means that a user has full CRUD control over the courses they and only they create. If a user gets deleted, then the associated courses get deleted.
    A user has one address with a foreign key of "address_id". User is to accept nested attributes of address to enable the display of the nested fields of the address form, but this feature is currently inoperable.
    A user has many enrolments, allowing them to enrol in as many courses as they want, subject to them not already being enrolled in said course. 
    
2. Courses 
    Courses belong to user who created it, with the foreign key of its author being 'user_id'. Only users who have the 'instructor' Boolean checked are able to post courses.
    A course can have one category from the category model represented by way of a foreign key stored on the courses table. This is intended to be expanded in the future allowing multiple categories on one course.
    A course can have one address with the foreign key on the courses table as 'address_id'. Course is to accept nested attributes of address to enable the display of the nested fields of the address form, but this feature is currently inoperable.
    A course has many users (ie those who are enrolled in them) through enrolments. 

3. Enrollments
    Enrollments (sic) belong to users with a User_id stored in the enrolments table. They also belong to courses table with a course_id stored in the enrolments table.

4. Address
    Address belongs to user with the foreign key of "address_id" inside the Users table.
    Address belongs to courses, with the foreign key of "address_id" stored inside the Courses table. 
    The intention is that addresses will only belong to Users and that Courses will access the addresses through Users to avoid duplication of addresses on different Course records and User records.

5. Category
    Category belongs_to courses with a foreign key of category_id stored on course records. To be implemented is allowing multiple category IDs to be stored on a course. 


## R18	Discuss the database relations to be implemented in your application

The Users table has a one to one relationship with the addresses table. A user can have one address. The users table has a one to many relationship to the courses table. This is indicated through the ERD that shows the one to many relationship.
The addresses table has a one to one relationship with the users table. It can also have a one to one relationship with the courses table. An address must have either a a Course or a User to be created. Eventually an address is to only be associated and available through users to avoid duplication of records. This is indicated through the ERD.
The courses table has a many to one relationship with the users table in that a User can have many Courses. This is indicated through the ERD.
The enrolment (sic) table can have one user per record, but a user can have many records. Similarly a record can have a single course on it, but courses can have many enrolments. This is indicated through the ERD.
A course can have a single category, but a category can have many courses. This is indicated through the ERD that shows the one to many relationship.



## R19	Provide your database schema design
![Schema](./docs/T2A2.png)


## R20	Describe the way tasks are allocated and tracked in your project
https://trello.com/b/X0En7Igh/findcpd

At first instance, tasks were managed by way of trello board. As someone who has previously used more task-oriented approaches to project management (as opposed to the Kanban board approach) I found myself more focused on identifying problems and resolving them. The task lists were pen and paper which meant they were right in front of me. I also used Sticky Notes in Windows to keep track of useful links or commands.
Github version control was used extensively and code rollback was used on occasion to overcome issues. Many git pushes were to provide a restore point should issues arise when creating model, controller or altering tables.
As someone who had not built a Rails project from scratch, to scaffold out the entire project was difficult for me as it was difficult to anticipate the issues or how long it would take to resolve issues. I learned from my previous assignment that continual testing and incremental building of a project is the only way to make it work, especially being inexperienced in Rails.



15 November 2021
GitHub created.
Rails project re-created as previous project had serious errors.
Initial Course controller actions were created as were the course form.
Devise was installed.
Database relationships were created.

16 November 2021
CSS that reset browser defaults inserted.
Course controller had further paths added.
Course controller had validation added.
User relationships were created.
Course form was modified.
Navbar was created.
Routes refined.

17 November 2021
params were added to the course controller.
Relationships between course and controller modified.
Enrollments(sic) table created and relationships defined.

[18-19 November 2021 were primarily drafting another assignment]

19 November 2021
Acquired data for site

20 November 2021
Course params altered to reflect new DB fields
New course fields added
Had difficulty in signing up for S3

21 November 2021
[Sat exam for another project]
Added Amazon S3 hosting

22 November 2021
Sought to refine Enrollments(sic) controller

23 November 2021
Viewing enrollments(sic) and own courses working
Did several deployments to Heroku to test it working- refined code as a result
Installed Bootstrap

24 November 2021
Added Categories table 
Modified CSS file to fix Heroku deployment issues

25 November 2021
A Model created for Category to allow it to be accessible to Courses.
Category now displays on Course show page
Created further validation on instructors
Installed field masking and sought to add addresses fields to Courses pages and User pages, but neither shows.

26 November 2021
Resolved duplicated enrolments
Altered CSS file to fix Heroku issue
Submitted assignment
