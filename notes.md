- How do you approach learning a different framework (Django, Phoenix)?

  - MVC
  - programming language
  - node.js - express
  - don't fight the framework!

- How does protect_from_forgery work? CSRF Cross Site Request Forgery

- Tips & Tricks for Rails Workflow

  - think about the data model
  - don't put a lot of logic in the controller
  - where do you put business logic?
      controller
      models: are data storage interfaces
      service_object: handle business logic
      class CreateUserWithNewPizzaOrder
        def initalize
          user = User.create(....)
          user.orders.create(...)
        end
      end

- difference between redirect & render - HTTP

  RENDER
  Browser: Hey, http server, give me /users  (GET /users)
  Server: Ok, here you go "<html><head>......."

  REDIRECT
  Browser: Hey, http server, give me /supersecret  (GET /supersecret)
  Server checks credentials
  Server: You are not logged in, request the login page first (status 301, "/login", "Please log in to see supersecret")  NO HTML
  Browser: Ok, http server give me /login
  Server: Ok here is the login page "<html><head>...<form>..."











- Asset Pipeline