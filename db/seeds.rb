["Active", "Selected", "Archived", "Inactive"].each do |cs|
	CodeState.find_or_create_by_name(cs)
end

seed_users_hash = [{"email" => "amokrane.chentir@gmail.com", "password" => "password", 
					"nickname" => "Amokrane", "website " => "http://www.chentir.com", 
					"biography" => "Programmer"},{"email" => "me@ghislaineguerin.com", "password" => "password", 
					"nickname" => "Ghislaine", "website " => "http://www.ghislaineguerin.com", 
					"biography" => "Designer"}, {"email" => "chentir@poste.isima.fr", "password" => "password", 
					"nickname" => "Chentir", "website " => "http://www.isima.fr", 
					"biography" => "Student"}, ]

seed_users_hash.each do |attributes|
  	User.create!(
  		attributes.merge!(
  			:password_confirmation => attributes[:password]
  		)
  	)
end

seed_codes_hash = [{"title" => "HelloWorld_C", "language" => "C", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	"description" => "Hello World In C", "user_id" => User.find_by_email("me@ghislaineguerin.com").id},  
 {"title" => "HelloWorld_Ruby", "language" => "Ruby", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	 "description" => "Hello World In Ruby", "user_id" => User.find_by_email("amokrane.chentir@gmail.com").id},  
 {"title" => "HelloWorld_JavaScript", "language" => "JavaScript", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	 "description" => "Hello World in JavaScript", "user_id" => User.find_by_email("amokrane.chentir@gmail.com").id},
	{"title" => "HelloWorld_C#", "language" => "C#", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	"description" => "Hello World In C#", "user_id" => User.find_by_email("chentir@poste.isima.fr").id},
{"title" => "HelloWorld_ObjC", "language" => "ObjC", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	"description" => "Hello World In Objective-C", "user_id" => User.find_by_email("me@ghislaineguerin.com").id},
{"title" => "HelloWorld_Scala", "language" => "Scala", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	"description" => "Hello World In Scala", "user_id" => User.find_by_email("me@ghislaineguerin.com").id, "code_state_id" => "3", "score" => "299"},
{"title" => "HelloWorld_Clojure", "language" => "Clojure", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	"description" => "Hello World In Clojure", "user_id" => User.find_by_email("me@ghislaineguerin.com").id, "code_state_id" => "3", "score" => "120"},
{"title" => "HelloWorld_Nodejs", "language" => "NodeJS", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	"description" => "Hello World In NodeJs", "user_id" => User.find_by_email("me@ghislaineguerin.com").id, "code_state_id" => "3", "score" => "120"},
{"title" => "HelloWorld_Lisp", "language" => "Lisp", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	"description" => "Hello World In Lisp", "user_id" => User.find_by_email("me@ghislaineguerin.com").id, "code_state_id" => "3", "score" => "44"},
{"title" => "HelloWorld_F#", "language" => "F#", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	"description" => "Hello World In F#", "user_id" => User.find_by_email("me@ghislaineguerin.com").id, "code_state_id" => "3", "score" => "244"},
{"title" => "HelloWorld_C#", "language" => "C#", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	"description" => "Hello World In C#", "user_id" => User.find_by_email("me@ghislaineguerin.com").id, "code_state_id" => "3", "score" => "515"},
{"title" => "HelloWorld_C++", "language" => "C++", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	"description" => "Hello World In C++", "user_id" => User.find_by_email("me@ghislaineguerin.com").id, "code_state_id" => "3", "score" => "22"},
{"title" => "HelloWorld_Lua", "language" => "Lua", "content" => "```ruby\r\nputs \"Hello World!\"\r\n```", 
	"description" => "Hello World In Lua", "user_id" => User.find_by_email("me@ghislaineguerin.com").id, "code_state_id" => "3", "score" => "99"}]


seed_codes_hash.each do |attributes|
  	Code.create!(attributes)
end

seed_tags_hash = [{"name" => "ruby", "nb_occurences" => "3"},
				 {"name" => "Java", "nb_occurences" => "10"}, 
				  {"name" => "C", "nb_occurences" => "1"}, 
					{"name" => "Scala", "nb_occurences" => "4"}]

seed_tags_hash.each do |attributes|
	Tag.create!(attributes)
end