#UvA Courses - Design document

**Summary**

UvA Courses is a webapp with which users can shop for courses they want to follow on the UvA.
A user can browse courses by using the search functionality or by browsing courses, institutes, staff and programmes on alphabetical order. 

**Controllers**
* static_pages_controller

    Controls basic pages like home, help, contact, about
    
* browse_courses_controller

    Enables any user (logged in or not) to browse through lists of courses,   institutes, staff and programmes. These lists are searchable with by a search bar on top of the page. Logged in users can also add courses to their shopping basket when viewing individual courses.

* users_controller

    Controlls user related functions like creating an account, editing a profile and showing profiles. This controller also takes care of viewing permission for certain pages.

* sessions_controller

    Enables users to stay logged in by use of cookies.

* lists_controller

    Allows for the creation and destruction of list_items, which form the user lists containing courses they have recently viewed, are currently taking and which they added to their shopping cart.

* search_controller

    Enables the general search function in the navbar.

**Routes**

* root static_pages#home
* /help static_pages#help
* /about static_pages#about
* /contact static_pages#about
* /signup users#new
* /signin sessions#new
* /signout sessions#destroy
* /search search#index


* /courses browse_courses#index
* /courses browse_courses#show
* /institutes browse_courses#index
* /institutes browse_courses#show
* /programmes browse_courses#index
* /programmes browse_courses#show
* /staff browse_courses#index
* /staff browse_courses#show


* /shopping_cart_items lists#create
* /shopping_cart_items lists#destroy
* /shopping_cart_items_noj lists#create
* /shopping_cart_items_noj lists#destroy
* /currently_taking_items lists#create
* /currently_taking_items lists#destroy


* resource users
* resource sessions, only: [:new, :create, :destroy]


**Helper functions**

*sign_in(user)*: Signs in a particular user.

*current_user*: Returns the current user.

*current_user?(user)*: Checks if user equals the current user. Returns true or false.

*signed_in?*: Checks if the current user is logged in. Returns true or false.

*signed_in_user*: Checks if a user is currently logged in and otherwise redirects to the signin page.

*sign_out*: Signs the current user out.

*redirect_back_or(default)*: Redirects a user who just logged in to the page he was trying to acces before logging in. If no such page exists it redirects to the homepage.

*store_location*: Stores which page the user is viewing previous to logging in.

*onList?(course_id, type)*: Checks if the course with course_id is on the user's list with listtype type. Returns true or false.

*AddToList!(course_id, type)*: Adds a course with course_id to the current user's list with listtype type.

*removeFromList!(course_id, type)*: Removes a course with course_id from the current user's list with listtype type.

**Models**
* Course

    Contains all information about courses.
    
    has_and_belongs_to_many :institutes
    
    has_and_belongs_to_many :staff
    
    has_and_belongs_to_many :programmes
    
    has_many :list_items
    
    has_many :users, through: :list_items
    
    **fields:**
    
    + name: string
    + description: text
    + acode: string
    + code: string
    + sgid: string
    + year: text
    + ects: integer
    + period: string
    + lecture_material: text
    + timetable: text
    + goals: text
    + participant_count: text
    + specialities: text
    + examination: text
    + created_at: datetime
    + updated_at: datetime
    

* Institute

    Contains all information about institutes
    
    has_and_belongs_to_many :courses
    
    **fields:**
    + name: string
    + created_at: datetime
    + updated_at: datetime
    

* Programme

    Contains all information about programmes.
    
    has_and_belongs_to_many :courses
    
    **fields**
    + name: string
    + url: string
    + created_at: datetime
    + updated_at: datetime


* Staff

    Contains all information about staff members.
    
    has_and_belongs_to_many :courses
    
    **fields:**
    + name: string
    + url: string
    + created_at: datetime
    +updated_at: datetime
    
    
* User

    Contains all information about users.
    
    has_many :list_items
    
    has_many :courses, through: :list_items
    
    **fields:**
    + name: string
    + email: string
    + created_at: datetime
    + updated_at: datetime
    + password_digest: string
    + remember_token: string
    + admin: boolean
    
    
* List_item
    
    Creates the link between users and the courses they currently take, have recently viewed or have in their shopping cart

    belongs_to :course
    belongs_to :user
    
    **fields:**
    + user_id: integer
    + course_id: integer
    + list_type: integer
    + created_at: datetime
    + updated_at: datetime
    
    
**Tables**

Each of the models previously mentioned have a corresponding table but for some of the relations a join table has also been created which will be listed here:

* courses_institutes
    + course_id: integer
    + institute_id: integer
* courses_programmes
    + course_id: integer
    + programme_id: integer
* courses_staffs
    + course_id: integer
    + staff_id: integer
    
**Ruby Gems**
* nokogiri

    We use nokogiri mainly in the database seed to read the different xml tags from the database file.

* sanitize

    The sanitize gem will be used to strip html tags and punctuation from the data gathered by nokogiri.

* will-paginate

    Will paginate will be used to display large amounts of information in a clear way on different pages.
    
* textacular

    The Textacular gem is used to search the database for entries from the navbar search form.

**Style guide**

We will hold on to the same style used in the Rails Tutorial by Michael Hartl which can be found on http://ruby.railstutorial.org

**Mockups**

For mockups check doc folder