# UvA Courses   
**Summary:**   
*implement a mobile web app with which users can shop for UvA courses.*   
**Features list:**

**Setup:**
clone repo
    
    git clone https://github.com/JaapWijnen/uva_courses.git JaapWijnen

make sure all the gems are there

    cd JaapWijnen
    bundle

Initialize and seed database (this can take a while)

    rake db:setup

To Create some dummy accounts use the following command

    rake db:populate

start server

    rails s



* get data from courses.xml 
* an UI designed for smartphone use with a width defined by device-width  
* app must support courses from at least the Faculty of Science  
* app must allow users to browse courses by department  
* search function for courses by keyword, which can appear in:    
  + catalog number
  + title  
  + description  
  + instructors' names    
* app must be able to show info of courses:
  + catalog number  
  + title
  + institute
  + credits
  + description
  + staff
  + programmes
  + participant count
* enable and support 2 lists: Courses I'm shopping, Courses I'm Taking
* Special list: Recently Viewed

**List of languages/technologies:**  

* HTML5  
* Javascript
* Ruby
* jQuery (Mobile)
* Ruby on Rails 4
* GitHub
* Bootstrap

**Mockups**

For mockups check doc folder.